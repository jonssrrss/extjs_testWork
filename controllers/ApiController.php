<?
	class ApiController {
		public static function actionUsers() {
			require_once(ROOT.'/components/Db.php');
			require_once(ROOT.'/models/api/users.php');
		}

		public static function actionUser_info() {
			require_once(ROOT.'/components/Db.php');
			require_once(ROOT.'/models/api/user_info.php');
		}
	}