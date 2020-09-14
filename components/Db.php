<?
    class Db {
        public static function getConnection() {
            $paramsPath = ROOT.'/config/db_params.php';
            $params = include($paramsPath);
            $dsn = "mysql:host={$params['host']};dbname={$params['dbname']};charset=utf8";
            $db = new PDO($dsn, $params['user'], $params['password']);
            return $db;
        }
    
        public static function insert($query) {
            $db = Db::getConnection();
            $result = $db -> query($query);
            return $db -> lastInsertId();
        }
      
        public static function select($query) {
            $arr = array();
            $db = Db::getConnection();
            $result = $db -> query($query);
            $result -> setFetchMode(PDO::FETCH_ASSOC);
            $i = 0;
            while ($row = $result -> fetch()) {
                $arr[$i] = $row;
                $i++;
            }
            return $arr;
        }

        public static function update($db, $query) {
            $db -> query($query);
        }
    }