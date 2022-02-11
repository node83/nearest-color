#!/usr/bin/php
<?php

if ($_SERVER['argc'] != 2) {
    echo 'usage: ' . basename(__FILE__) . ' <hexcolor>' . PHP_EOL;
    exit;
}

$input = $_SERVER['argv'][1];
if (!preg_match('`^[0-9a-f]{6}$`ims', $input)) {
    echo 'usage: ' . basename(__FILE__) . ' <hexcolor>' . PHP_EOL;
    exit;
}

$colors = <<<TEXT
colors.slate 50 #f8fafc
colors.slate 100 #f1f5f9
colors.slate 200 #e2e8f0
colors.slate 300 #cbd5e1
colors.slate 400 #94a3b8
colors.slate 500 #64748b
colors.slate 600 #475569
colors.slate 700 #334155
colors.slate 800 #1e293b
colors.slate 900 #0f172a
colors.gray 50 #f9fafb
colors.gray 100 #f3f4f6
colors.gray 200 #e5e7eb
colors.gray 300 #d1d5db
colors.gray 400 #9ca3af
colors.gray 500 #6b7280
colors.gray 600 #4b5563
colors.gray 700 #374151
colors.gray 800 #1f2937
colors.gray 900 #111827
colors.zinc 50 #fafafa
colors.zinc 100 #f4f4f5
colors.zinc 200 #e4e4e7
colors.zinc 300 #d4d4d8
colors.zinc 400 #a1a1aa
colors.zinc 500 #71717a
colors.zinc 600 #52525b
colors.zinc 700 #3f3f46
colors.zinc 800 #27272a
colors.zinc 900 #18181b
colors.neutral 50 #fafafa
colors.neutral 100 #f5f5f5
colors.neutral 200 #e5e5e5
colors.neutral 300 #d4d4d4
colors.neutral 400 #a3a3a3
colors.neutral 500 #737373
colors.neutral 600 #525252
colors.neutral 700 #404040
colors.neutral 800 #262626
colors.neutral 900 #171717
colors.stone 50 #fafaf9
colors.stone 100 #f5f5f4
colors.stone 200 #e7e5e4
colors.stone 300 #d6d3d1
colors.stone 400 #a8a29e
colors.stone 500 #78716c
colors.stone 600 #57534e
colors.stone 700 #44403c
colors.stone 800 #292524
colors.stone 900 #1c1917
colors.red 50 #fef2f2
colors.red 100 #fee2e2
colors.red 200 #fecaca
colors.red 300 #fca5a5
colors.red 400 #f87171
colors.red 500 #ef4444
colors.red 600 #dc2626
colors.red 700 #b91c1c
colors.red 800 #991b1b
colors.red 900 #7f1d1d
colors.orange 50 #fff7ed
colors.orange 100 #ffedd5
colors.orange 200 #fed7aa
colors.orange 300 #fdba74
colors.orange 400 #fb923c
colors.orange 500 #f97316
colors.orange 600 #ea580c
colors.orange 700 #c2410c
colors.orange 800 #9a3412
colors.orange 900 #7c2d12
colors.amber 50 #fffbeb
colors.amber 100 #fef3c7
colors.amber 200 #fde68a
colors.amber 300 #fcd34d
colors.amber 400 #fbbf24
colors.amber 500 #f59e0b
colors.amber 600 #d97706
colors.amber 700 #b45309
colors.amber 800 #92400e
colors.amber 900 #78350f
colors.yellow 50 #fefce8
colors.yellow 100 #fef9c3
colors.yellow 200 #fef08a
colors.yellow 300 #fde047
colors.yellow 400 #facc15
colors.yellow 500 #eab308
colors.yellow 600 #ca8a04
colors.yellow 700 #a16207
colors.yellow 800 #854d0e
colors.yellow 900 #713f12
colors.lime 50 #f7fee7
colors.lime 100 #ecfccb
colors.lime 200 #d9f99d
colors.lime 300 #bef264
colors.lime 400 #a3e635
colors.lime 500 #84cc16
colors.lime 600 #65a30d
colors.lime 700 #4d7c0f
colors.lime 800 #3f6212
colors.lime 900 #365314
colors.green 50 #f0fdf4
colors.green 100 #dcfce7
colors.green 200 #bbf7d0
colors.green 300 #86efac
colors.green 400 #4ade80
colors.green 500 #22c55e
colors.green 600 #16a34a
colors.green 700 #15803d
colors.green 800 #166534
colors.green 900 #14532d
colors.emerald 50 #ecfdf5
colors.emerald 100 #d1fae5
colors.emerald 200 #a7f3d0
colors.emerald 300 #6ee7b7
colors.emerald 400 #34d399
colors.emerald 500 #10b981
colors.emerald 600 #059669
colors.emerald 700 #047857
colors.emerald 800 #065f46
colors.emerald 900 #064e3b
colors.teal 50 #f0fdfa
colors.teal 100 #ccfbf1
colors.teal 200 #99f6e4
colors.teal 300 #5eead4
colors.teal 400 #2dd4bf
colors.teal 500 #14b8a6
colors.teal 600 #0d9488
colors.teal 700 #0f766e
colors.teal 800 #115e59
colors.teal 900 #134e4a
colors.cyan 50 #ecfeff
colors.cyan 100 #cffafe
colors.cyan 200 #a5f3fc
colors.cyan 300 #67e8f9
colors.cyan 400 #22d3ee
colors.cyan 500 #06b6d4
colors.cyan 600 #0891b2
colors.cyan 700 #0e7490
colors.cyan 800 #155e75
colors.cyan 900 #164e63
colors.sky 50 #f0f9ff
colors.sky 100 #e0f2fe
colors.sky 200 #bae6fd
colors.sky 300 #7dd3fc
colors.sky 400 #38bdf8
colors.sky 500 #0ea5e9
colors.sky 600 #0284c7
colors.sky 700 #0369a1
colors.sky 800 #075985
colors.sky 900 #0c4a6e
colors.blue 50 #eff6ff
colors.blue 100 #dbeafe
colors.blue 200 #bfdbfe
colors.blue 300 #93c5fd
colors.blue 400 #60a5fa
colors.blue 500 #3b82f6
colors.blue 600 #2563eb
colors.blue 700 #1d4ed8
colors.blue 800 #1e40af
colors.blue 900 #1e3a8a
colors.indigo 50 #eef2ff
colors.indigo 100 #e0e7ff
colors.indigo 200 #c7d2fe
colors.indigo 300 #a5b4fc
colors.indigo 400 #818cf8
colors.indigo 500 #6366f1
colors.indigo 600 #4f46e5
colors.indigo 700 #4338ca
colors.indigo 800 #3730a3
colors.indigo 900 #312e81
colors.violet 50 #f5f3ff
colors.violet 100 #ede9fe
colors.violet 200 #ddd6fe
colors.violet 300 #c4b5fd
colors.violet 400 #a78bfa
colors.violet 500 #8b5cf6
colors.violet 600 #7c3aed
colors.violet 700 #6d28d9
colors.violet 800 #5b21b6
colors.violet 900 #4c1d95
colors.purple 50 #faf5ff
colors.purple 100 #f3e8ff
colors.purple 200 #e9d5ff
colors.purple 300 #d8b4fe
colors.purple 400 #c084fc
colors.purple 500 #a855f7
colors.purple 600 #9333ea
colors.purple 700 #7e22ce
colors.purple 800 #6b21a8
colors.purple 900 #581c87
colors.fuchsia 50 #fdf4ff
colors.fuchsia 100 #fae8ff
colors.fuchsia 200 #f5d0fe
colors.fuchsia 300 #f0abfc
colors.fuchsia 400 #e879f9
colors.fuchsia 500 #d946ef
colors.fuchsia 600 #c026d3
colors.fuchsia 700 #a21caf
colors.fuchsia 800 #86198f
colors.fuchsia 900 #701a75
colors.pink 50 #fdf2f8
colors.pink 100 #fce7f3
colors.pink 200 #fbcfe8
colors.pink 300 #f9a8d4
colors.pink 400 #f472b6
colors.pink 500 #ec4899
colors.pink 600 #db2777
colors.pink 700 #be185d
colors.pink 800 #9d174d
colors.pink 900 #831843
colors.rose 50 #fff1f2
colors.rose 100 #ffe4e6
colors.rose 200 #fecdd3
colors.rose 300 #fda4af
colors.rose 400 #fb7185
colors.rose 500 #f43f5e
colors.rose 600 #e11d48
colors.rose 700 #be123c
colors.rose 800 #9f1239
colors.rose 900 #881337
TEXT;

$input = ltrim(strtoupper($input), '#');
$best = (object)['name' => null, 'hex' => null, 'distance' => pow(16, 6)];

foreach (explode("\n", trim($colors)) as $line) {
    list($name, $level, $color) = explode(" ", $line);
    $distance = distance($input, $color);
    if ($distance < $best->distance) {
        $best = (object)[
            'name' => $name,
            'level' => $level,
            'color' => $color,
            'distance' => $distance
        ];
        if (false) {
            echo sprintf("%-20s %6.2f %s\n", $name . ' ' . $level, $distance, $color);
        }
    }
}

echo "The color $input maps onto the tailwind color '{$best->name} {$best->level}' ({$best->color})\n";

function distance($c1, $c2)
{
    $c1 = trim($c1, "#");
    $c2 = trim($c2, "#");

    $r1 = base_convert(substr($c1, 0, 2), 16, 10);
    $g1 = base_convert(substr($c1, 2, 2), 16, 10);
    $b1 = base_convert(substr($c1, 4, 2), 16, 10);

    $r2 = base_convert(substr($c2, 0, 2), 16, 10);
    $g2 = base_convert(substr($c2, 2, 2), 16, 10);
    $b2 = base_convert(substr($c2, 4, 2), 16, 10);

    return sqrt(pow($r2 - $r1, 2) + pow($g2 - $g1, 2) + pow($b2 - $b1, 2));
}
