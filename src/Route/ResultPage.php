<?php

declare(strict_types=1);

namespace Quiz\Route;

use Quiz\TestResults;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Twig\Environment;

class ResultPage
{
    private Environment $view;

    private TestResults $testResults;

    public function __construct(Environment $view, TestResults $testResults)
    {
        $this->view = $view;
        $this->testResults = $testResults;
    }

    public function __invoke(Request $request, Response $response, array $args = []): Response
    {
        $results = $this->testResults->get((int) $args['id']);
    
        if(empty($results)) {
    
            $body = $this->view->render('not-found.twig');
    
        } else {
    
            $body = $this->view->render('/quiz/result.twig', [
                'results' => $results
            ]);
        }
    
        $response->getBody()->write($body);
        return $response;
    }
}