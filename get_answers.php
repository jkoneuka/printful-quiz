<?php

require __DIR__ . '/vendor/autoload.php';

use DevCoder\DotEnv;
use Quiz\Answers;

$absolutePathToEnvFile = __DIR__ . '/.env';
(new DotEnv($absolutePathToEnvFile))->load();

if(isset($_POST['id'])) {

    $pdo = new PDO(getenv('DATABASE_DSN'), getenv('DATABASE_USERNAME'), getenv('DATABASE_PASSWORD'));
    
    $answers = new Answers($pdo);
    
    echo json_encode($answers->getAllById((int) $_POST['id']));

}  else echo 'No id provided';