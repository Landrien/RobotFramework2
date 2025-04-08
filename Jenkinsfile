pipeline {
    agent any
    environment {
        XRAY_AUTH_URL = "https://xray.cloud.getxray.app/api/v2/authenticate"
        
        XRAY_REPORT_XML = "https://xray.cloud.getxray.app/api/v2/import/execution/robot?projectKey=POEI20252"
        CLIENT_ID = "81C7FEA9A5464340974B1548E5ADFA37"
        CLIENT_SECRET = "c3d20d2db84ce7fd05f4ca00bdd07d9aae16fe14b59b96712af9a1bf8c6171fe"
        XRAY_TOKEN = ""
    }
    stages {
        stage('Authenticate with Xray') {
            steps {
                script {
                    def authResponse = bat(
                        script: """
                            curl -H "Content-Type: application/json" -X POST --data ^
                            "{\\"client_id\\": \\"${CLIENT_ID}\\", \\"client_secret\\": \\"${CLIENT_SECRET}\\"}" ^
                            ${XRAY_AUTH_URL} 2> nul
                        """,
                        returnStdout: true
                    ).trim()

                    //echo "Xray Authentication Response: ${authResponse}"

                    // Récupère la dernière ligne = le token
                    def lines = authResponse.readLines()
                    def token = lines[1].replaceAll('"', '').trim()

                    XRAY_TOKEN = token
                    echo "Xray Token: ${XRAY_TOKEN}"
                }
            }
        }
        stage('Test') {
            steps {
                bat 'robot -d results Tests/'
            }
        }

        stage('Export report à XRAY') {
            steps {
                script {
                    def exportResponse = bat(
                        script: """
                            curl -H "Content-Type: text/xml" ^
                            -X POST -H "Authorization: Bearer ${XRAY_TOKEN}" ^
                            --data @results/output.xml ${XRAY_REPORT_XML}
                        """,
                        returnStdout: true
                    ).trim()

                    echo "Xray export response: ${exportResponse}"
                }
            }
        }
        stage('Discord notification') {
            steps {
            script {
                def testResults = readFile('results/output.xml')
                def totalTests = testResults.count('<testcase')
                def failedTests = testResults.count('<failure')
                def passedTests = totalTests - failedTests

                def discordPayload = """
                {
                "embeds": [{
                    "title": "Test Results",
                    "color": 3066993,
                    "fields": [
                    {
                        "name": "Total Tests",
                        "value": "${totalTests}",
                        "inline": true
                    },
                    {
                        "name": "Passed",
                        "value": "${passedTests}",
                        "inline": true
                    },
                    {
                        "name": "Failed",
                        "value": "${failedTests}",
                        "inline": true
                    }
                    ]
                }]
                }
                """

                writeFile file: 'discordPayload.json', text: discordPayload
                bat 'curl -H "Content-Type: application/json" -X POST --data @discordPayload.json https://discordapp.com/api/webhooks/1359154405147934992/2RwoZD57gNSStkB8yxAUT4O7jAe7OOAECZTCuMj9tDW6RBHYUaCjgon1E05MoTjsaQlg'
            }
            }
        }
    }
}