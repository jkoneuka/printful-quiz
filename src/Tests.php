<?php

declare(strict_types=1);

namespace Quiz;

class Tests
{
    private Database $database;

    public function __construct(Database $database)
    {
        $this->database = $database;
    }

    public function getAll(): ?array
    {
        $statement = $this->database->getConnection()->prepare(
            'SELECT * FROM tests'
        );

        $statement->execute();

        return $statement->fetchAll();
    }
}