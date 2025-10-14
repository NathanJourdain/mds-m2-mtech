<?php
declare(strict_types=1);

namespace Mtech;

final class Calculator
{
    public static function add(int $a, int $b): int
    {
        return $a + $b;
    }

    public static function subtract(int $a, int $b): int
    {
        throw new \RuntimeException('Not implemented yet');
    }
}