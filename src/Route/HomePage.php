<?php

declare(strict_types=1);

namespace Quiz\Route;

use Quiz\Tests;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Twig\Environment;

class HomePage
{
    private Tests $tests;

    private Environment $view;

    public function __construct(Tests $tests, Environment $view)
    {
        $this->tests = $tests;
        $this->view = $view;
    }

    public function execute(Request $request, Response $response): Response
    {
        $quizTests = $this->tests->getAll();
    
        $body = $this->view->render('index.twig', [
            'tests' => $quizTests
        ]);
    
        $response->getBody()->write($body);
        return $response;
    }
}