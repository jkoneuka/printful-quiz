<?php

declare(strict_types=1);

namespace Quiz\Test\Unit;

use Quiz\Database;
use PDO;
use PHPUnit\Framework\MockObject\MockObject;
use PHPUnit\Framework\TestCase;

class DatabaseTest extends TestCase
{
    private Database $object;

    private MockObject $connection;

    protected function setUp(): void
    {
        $this->connection = $this->createMock(PDO::class);
        $this->object = new Database($this->connection);
    }

    public function testGetConnection(): void
    {
        $result = $this->object->GetConnection();
        $this->assertInstanceOf(PDO::class, $result);
    }
}