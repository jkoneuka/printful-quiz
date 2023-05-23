<?php

declare(strict_types=1);

namespace Quiz;

class TestResults
{
    private Database $database;

    public function __construct(Database $database)
    {
        $this->database = $database;
    }

    public function get(int $id): ?array
    {
        $statement = $this->database->getConnection()->prepare('SELECT * FROM results WHERE id = :id');
        $statement->execute([
            'id' => $id
        ]);

        return $statement->fetchAll();
    }

    public function add(int $t_id, string $full_name, int $answers): ?int
    {
        $statement = $this->database->getConnection()->prepare('INSERT INTO results (t_id, fullname, answers) VALUES (:t_id, :full_name, :answers)');
        $statement->execute([
            't_id' => $t_id,
            'full_name' => $full_name,
            'answers' => $answers
        ]);
        
        $lastId = (int) $this->database->getConnection()->lastInsertId();
        return $lastId;
    }
}