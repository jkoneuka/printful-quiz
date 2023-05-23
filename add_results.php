<?php

require __DIR__ . '/vendor/autoload.php';

use DevCoder\DotEnv;
use Quiz\TestResults;
use Quiz\Database;

$absolutePathToEnvFile = __DIR__ . '/.env';
(new DotEnv($absolutePathToEnvFile))->load();

if(isset($_POST['id'])) {

    $pdo = new PDO(getenv('DATABASE_DSN'), getenv('DATABASE_USERNAME'), getenv('DATABASE_PASSWORD'));
    $db = new Database($pdo);
    $results = new TestResults($db);

    $id = $results->add((int) $_POST['id'], (string) $_POST['fullName'], (int) $_POST['answers']);

    echo json_encode(['id' => $id]);

}  else echo 'No id provided';