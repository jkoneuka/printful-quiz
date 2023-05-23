<?php

declare(strict_types=1);

namespace Quiz;

use PDO;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;

class Questions
{

    private PDO $connection;

    public function __construct(PDO $connection)
    {
        $this->connection = $connection;
    }

    public function getAllById(int $t_id): ?array
    {
        $statement = $this->connection->prepare('SELECT * FROM questions WHERE t_id = :t_id');
        $statement->execute([
            't_id' => $t_id
        ]);

        return $statement->fetchAll(PDO::FETCH_ASSOC);
    }
}