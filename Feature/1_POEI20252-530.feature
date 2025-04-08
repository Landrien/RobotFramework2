Feature: Connexion Invalide Parabank

	@POEI20252-530 @Hadrien @ParaBank
	Scenario: Connexion Invalide Parabank
		Given L'utilisateur est sur la page de connexion
		When L'utilisateur saisit son username "jjj" invalide
		And L'utilisateur saisit son password "bbbb" invalide
		And L'utilisateur clique sur le bouton de connexion
		Then L'utilisateur reste sur la page de connexion
		
