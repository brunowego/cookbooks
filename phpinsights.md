# PHP Insights

<!--
https://github.com/nunomaduro/phpinsights
-->

TODO

```php
<?php

declare(strict_types=1);

return [
    'preset' => 'default',
    'exclude' => [
        //  'path/to/directory-or-file'
    ],
    'add' => [
        //  ExampleMetric::class => [
        //      ExampleInsight::class,
        //  ]
        NunoMaduro\PhpInsights\Domain\Metrics\Code\Code::class => [
            SlevomatCodingStandard\Sniffs\ControlStructures\RequireYodaComparisonSniff::class,
        ],
    ],
    'remove' => [
        //  ExampleInsight::class,
        SlevomatCodingStandard\Sniffs\ControlStructures\DisallowShortTernaryOperatorSniff::class,
        SlevomatCodingStandard\Sniffs\ControlStructures\DisallowYodaComparisonSniff::class,
        SlevomatCodingStandard\Sniffs\PHP\UselessParenthesesSniff::class,
        SlevomatCodingStandard\Sniffs\TypeHints\DisallowArrayTypeHintSyntaxSniff::class,
        SlevomatCodingStandard\Sniffs\TypeHints\UselessConstantTypeHintSniff::class,
        PhpCsFixer\Fixer\ControlStructure\NoUnneededControlParenthesesFixer::class,
        PhpCsFixer\Fixer\Operator\TernaryOperatorSpacesFixer::class,
        PhpCsFixer\Fixer\Phpdoc\PhpdocInlineTagFixer::class,
        PhpCsFixer\Fixer\Phpdoc\PhpdocSeparationFixer::class,
        PhpCsFixer\Fixer\Phpdoc\AlignMultilineCommentFixer::class,
        PHP_CodeSniffer\Standards\PSR2\Sniffs\ControlStructures\ElseIfDeclarationSniff::class,
        PHP_CodeSniffer\Standards\Generic\Sniffs\Formatting\SpaceAfterCastSniff::class,
    ],
    'config' => [
        //  ExampleInsight::class => [
        //      'key' => 'value',
        //  ],
        ObjectCalisthenics\Sniffs\NamingConventions\ElementNameMinimalLengthSniff::class => [
            'minLength' => 3,
            'allowedShortNames' => ['i', 'id', 'to', 'up', 'ky', 'vl', 'e'],
        ],
        PhpCsFixer\Fixer\CastNotation\CastSpacesFixer::class => [
            'space' => 'none',
        ],
        PhpCsFixer\Fixer\Basic\BracesFixer::class => [
            'allow_single_line_closure' => false,
            'position_after_anonymous_constructs' => 'next',
            'position_after_control_structures' => 'next',
            'position_after_functions_and_oop_constructs' => 'next',
        ],
        SlevomatCodingStandard\Sniffs\Commenting\DocCommentSpacingSniff::class => [
            'linesCountBeforeFirstContent' => 0,
            'linesCountBetweenDescriptionAndAnnotations' => 1,
            'linesCountBetweenDifferentAnnotationsTypes' => 0,
            'linesCountBetweenAnnotationsGroups' => 0,
            'linesCountAfterLastContent' => 0,
            'annotationsGroups' => [],
        ],
        PhpCsFixer\Fixer\Whitespace\NoExtraBlankLinesFixer::class => [
            'tokens' => [], // possibles values ['break', 'case', 'continue', 'curly_brace_block', 'default', 'extra', 'parenthesis_brace_block', 'return', 'square_brace_block', 'switch', 'throw', 'use', 'use_trait']
        ]
    ],
];
```
