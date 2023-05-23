<?php

declare(strict_types=1);

namespace Quiz;

use PDO;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;

class Answers
{

    private PDO $connection;

    public function __construct(PDO $connection)
    {
        $this->connection = $connection;
    }

    public function getAllById(int $id): ?array
    {
        $statement = $this->connection->prepare('SELECT * FROM answers WHERE q_id = :id');
        $statement->execute([
            'id' => $id
        ]);

        return $statement->fetchAll(PDO::FETCH_ASSOC);
    }
}