<?php

use Slim\Factory\AppFactory;
use DI\ContainerBuilder;
use DevCoder\DotEnv;
use Quiz\Route\HomePage;
use Quiz\Route\ResultPage;
use Quiz\Questions;
use Quiz\Answers;

require __DIR__ . '/vendor/autoload.php';
$builder = new ContainerBuilder();
$builder->addDefinitions('config/di.php');

$absolutePathToEnvFile = __DIR__ . '/.env';
(new DotEnv($absolutePathToEnvFile))->load();

$container = $builder->build();

AppFactory::setContainer($container);

$app = AppFactory::create();

$app->addErrorMiddleware(true, true, true);
$app->setBasePath("/printful-quiz");

$app->get('/', HomePage::class . ':execute');
$app->get('/result/{id}', ResultPage::class);

$app->run();