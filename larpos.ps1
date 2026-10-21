# LARPOS - a fake hacker terminal. Parody only. Nothing here does anything real. That's the joke.

$ErrorActionPreference = 'SilentlyContinue'
$Host.UI.RawUI.WindowTitle = 'anon@arch: ~'
$ImagePath = Join-Path $PSScriptRoot 'assets\LARPOPSEC.webp'
$rng = New-Object System.Random

function Say($text, $color = 'Gray') { Write-Host $text -ForegroundColor $color }

function Type($text, $color = 'Green', $delay = 35) {
    foreach ($ch in $text.ToCharArray()) {
        Write-Host $ch -NoNewline -ForegroundColor $color
        Start-Sleep -Milliseconds $delay
    }
    Write-Host ''
}

function Show-Banner {
    Clear-Host
    Say '  _      _   ___ ___   ___  ___ ' Green
    Say ' | |    /_\ | _ \ _ \ / _ \/ __|' Green
    Say ' | |__ / _ \|   /  _/| (_) \__ \' Green
    Say ' |____/_/ \_\_|_\_|   \___/|___/' Green
    Say ''
    Say ' LARPOS v1.0 "Definitely Not A Raspberry Pi" Edition' DarkGray
    Say ' Type "cmds" to see everything you can pretend to do.' DarkGray
    Say ''
}

function Show-Cmds {
    Say ''
    Say '  === AVAILABLE COMMANDS (all of them fake, like your threat model) ===' Cyan
    Say ''
    $rows = @(
        @('cmds / help',        'this menu, genius'),
        @('sudo apt install opsec arch linux hello world print', 'the real one. you know what it does'),
        @('whoami',             'find out who you really are (not much)'),
        @('neofetch',           'flex your totally-Arch machine'),
        @('nmap <target>',      'scan the Pentagon (it is your router)'),
        @('doxx <name>',        'doxx someone (spoiler: you get their cat)'),
        @('vpn',                'check your 14 layers of VPN'),
        @('tor',                'tor over vpn over tor over vpn'),
        @('opsec',              'a risk assessment of you'),
        @('hack <target>',      'hack the planet'),
        @('ls / pwd / cat <f>', 'look around your very real files'),
        @('ping <host>',        'ping literally anyone'),
        @('ifconfig',           'your IP is 127.0.0.1 bro it is fine'),
        @('echo <text>',        'say things'),
        @('history',            'what have you been doing'),
        @('feds',               'summon the feds (they also show up randomly)'),
        @('rm -rf /',           'try it. we dare you.'),
        @('hello world',        'classic'),
        @('clear / exit',       'leave the matrix')
    )
    foreach ($r in $rows) {
        Write-Host ('  {0}' -f $r[0].PadRight(52)) -NoNewline -ForegroundColor Yellow
        Say ('- ' + $r[1]) Gray
    }
    Say ''
}

function Show-Arch {
    $arch = @'
                   -`
                  .o+`
                 `ooo/
                `+oooo:
               `+oooooo:
               -+oooooo+:
             `/:-:++oooo+:
            `/++++/+++++++:
           `/++++++++++++++:
          `/+++ooooooooooooo/`
         ./ooosssso++osssssso+`
        .oossssso-````/ossssss+`
       -osssssso.      :ssssssso.
      :osssssss/        osssso+++.
     /ossssssss/        +ssssooo/-
   `/ossssso+/:-        -:/+osssso+-
  `+sso+:-`                 `.-/+oso:
 `++:.                           `-/+/
 .`                                 `/
'@
    return $arch
}

function Show-Mullvad {
    Say '   +-----------------------------------+' Yellow
    Say '   |   __  __ _   _ _    _    __   ___  |' Yellow
    Say '   |  |  \/  | | | | |  | |  | \ \ / / |' Yellow
    Say '   |  | |\/| | | | | |  | |  | |\ V /  |' Yellow
    Say '   |  |_|  |_|\___/|_|__|_|__|_| \_/   |' Yellow
    Say '   |          M U L L V A D   V P N     |' Yellow
    Say '   |    [ CONNECTED - sweden, probably ]|' Green
    Say '   +-----------------------------------+' Yellow
}

function Open-LarpImage {
    if (-not (Test-Path $ImagePath)) {
        Say "  (could not find $ImagePath - the LARP image is missing, opsec failure)" Red
        return
    }
    $uri = ([System.Uri]$ImagePath).AbsoluteUri
    $html = @"
<!doctype html><html><head><meta charset="utf-8"><title>LARPOPSEC</title>
<style>
html,body{margin:0;height:100%;background:#000;color:#0f0;font-family:Consolas,monospace;text-align:center}
img{max-width:92vw;max-height:84vh;border:2px solid #0f0;box-shadow:0 0 40px #0f0}
h1{margin:14px 0 10px;letter-spacing:4px;text-shadow:0 0 12px #0f0}
p{margin:8px;color:#0a0}
</style></head><body>
<h1>WELCOME TO DOXBIN OPSEC SUDO BRADAR</h1>
<img src="$uri">
<p>[ certified elite &bull; 0 real hackers were involved ]</p>
</body></html>
"@
    $page = Join-Path $env:TEMP 'larpopsec.html'
    Set-Content -Path $page -Value $html -Encoding UTF8
    Start-Process $page
}

function Invoke-Feds {
    $w = [Math]::Max(20, $Host.UI.RawUI.WindowSize.Width - 1)
    $h = [Math]::Max(10, $Host.UI.RawUI.WindowSize.Height - 1)
    $msgs = @('FBI OPEN UP', 'WE KNOW WHAT YOU DID', 'NICE OPSEC, BRADAR', 'STEP AWAY FROM THE KEYBOARD', 'WEEE-OOO WEEE-OOO')
    try {
        for ($f = 0; $f -lt 14; $f++) {
            $bg = if ($f % 2 -eq 0) { 'Red' } else { 'Blue' }
            $Host.UI.RawUI.BackgroundColor = $bg
            Clear-Host
            $msg = $msgs[$f % $msgs.Count]
            $pad = [Math]::Max(0, [int](($w - $msg.Length) / 2))
            1..([int]($h / 2 - 1)) | ForEach-Object { Write-Host '' }
            Write-Host ((' ' * $pad) + $msg) -ForegroundColor White
            if ($f % 2 -eq 0) { [Console]::Beep(900, 160) } else { [Console]::Beep(600, 160) }
        }
    } finally {
        $Host.UI.RawUI.BackgroundColor = 'Black'
        Clear-Host
    }
    Say '  ...' Gray
    Start-Sleep -Milliseconds 1200
    Say '  jk it was the pizza guy. he has a warrant for your pizza.' Green
    Say '  (nothing is real. no feds. go outside.)' DarkGray
    Say ''
}

function Invoke-Opsec-Sequence {
    Say ''
    Say '[sudo] password for anon: ********' Gray
    Start-Sleep -Milliseconds 700
    Say 'Reading package lists... Done' Gray
    Start-Sleep -Milliseconds 400
    Say 'Building dependency tree... Done' Gray
    Start-Sleep -Milliseconds 400
    Say 'The following NEW packages will be installed:' Gray
    Say '  opsec arch-linux-btw hello-world-print paranoia-lite mullvad-vpn tinfoil-hat' Gray
    Start-Sleep -Milliseconds 600
    Say 'Need to get 0 B of archives. After this operation, your ego will use 9001 GB.' Gray
    Start-Sleep -Milliseconds 800
    Say 'Disabling brain... ' Yellow
    Start-Sleep -Milliseconds 600
    Say 'Enabling hoodie... done' Yellow
    Start-Sleep -Milliseconds 600
    Say 'INITIATING HACKER SEQUENCE. DO NOT LOOK DIRECTLY AT THE CODE.' Red
    Start-Sleep -Milliseconds 1200

    # --- 10 seconds of Hollywood hacker nonsense ---
    Clear-Host
    $width = [Math]::Max(20, $Host.UI.RawUI.WindowSize.Width - 2)
    $phrases = @(
        'BYPASSING FIREWALL', 'INJECTING SQL INTO THE MAINFRAME', 'DECRYPTING THE GIBSON',
        'ACCESS GRANTED', 'ROOT OBTAINED', 'DOWNLOADING MORE RAM', 'SPOOFING MY OWN MAC (BAD IDEA)',
        'ENCRYPTING MY BROWSER HISTORY', 'ASKING CHATGPT HOW TO HACK', 'PORT 1337 OPEN',
        'IM IN', 'TRACING IP: 127.0.0.1', 'COMPILING KERNEL (BTW)', 'REROUTING THROUGH 47 PROXIES (ALL MY MOM''S WIFI)'
    )
    $sw = [System.Diagnostics.Stopwatch]::StartNew()
    while ($sw.Elapsed.TotalSeconds -lt 10) {
        $sb = New-Object System.Text.StringBuilder
        $mode = $rng.Next(0, 10)
        if ($mode -lt 6) {
            for ($i = 0; $i -lt $width; $i++) { [void]$sb.Append($rng.Next(0, 2)) }
            Write-Host $sb.ToString() -ForegroundColor DarkGreen
        } elseif ($mode -lt 8) {
            for ($i = 0; $i -lt [int]($width / 3); $i++) { [void]$sb.Append(('0x{0:X2} ' -f $rng.Next(0, 256))) }
            Write-Host $sb.ToString() -ForegroundColor Green
        } else {
            $p = $phrases[$rng.Next(0, $phrases.Count)]
            Write-Host ('[' + ('{0:X8}' -f $rng.Next()) + '] ' + $p) -ForegroundColor White
        }
        Start-Sleep -Milliseconds 18
    }

    # --- the reveal ---
    Clear-Host
    Write-Host (Show-Arch) -ForegroundColor Cyan
    Say '          A R C H   L I N U X   (I use Arch btw)' Cyan
    Say ''
    Show-Mullvad
    Say ''
    Start-Sleep -Milliseconds 900
    Type '  > opsec level: MAXIMUM (self-reported)' Green 30
    Type '  > threat model: my little brother' Green 30
    Type '  > feds notified: 0 (they were not invited)' Green 30
    Say ''
    Start-Sleep -Milliseconds 700
    Type '  WELCOME TO DOXBIN OPSEC SUDO BRADAR' Magenta 70
    Say ''
    Open-LarpImage
    Say '  (image opened in your browser. type "cmds" to keep LARPing)' DarkGray
    Say ''
    Start-Sleep -Seconds 7
    Say '  > incoming connection from 192.168.0.1 ...' Yellow
    Start-Sleep -Milliseconds 1500
    Invoke-Feds
}

function Show-Neofetch {
    $a = (Show-Arch) -split "`n" | Select-Object -First 8
    $info = @(
        'anon@arch-btw',
        '-------------',
        'OS: Arch Linux (in spirit)',
        'Host: Dell Optiplex from 2011',
        'Kernel: 6.9.69-hacker',
        'Shell: zsh (rewritten in my head)',
        'VPNs: 14',
        'Threat Model: Mom',
        'Packages: 3 (opsec, hoodie, vibes)'
    )
    for ($i = 0; $i -lt [Math]::Max($a.Count, $info.Count); $i++) {
        $l = ''
        if ($i -lt $a.Count) { $l = $a[$i].TrimEnd("`r") }
        Write-Host $l.PadRight(38) -NoNewline -ForegroundColor Cyan
        if ($i -lt $info.Count) { Write-Host $info[$i] -ForegroundColor White } else { Write-Host '' }
    }
}

$history = New-Object System.Collections.ArrayList
$cwd = '~'

Show-Banner

while ($true) {
    Write-Host 'anon' -NoNewline -ForegroundColor Green
    Write-Host '@' -NoNewline -ForegroundColor White
    Write-Host 'arch' -NoNewline -ForegroundColor Cyan
    Write-Host ":$cwd`$ " -NoNewline -ForegroundColor White
    $raw = [Console]::ReadLine()
    if ($null -eq $raw) { break }
    $cmd = ($raw.Trim() -replace '\s+', ' ')
    if ($cmd -eq '') { continue }
    [void]$history.Add($cmd)
    $lc = $cmd.ToLower()

    # 1-in-15 chance the feds crash the party on a random command
    if ($history.Count -gt 3 -and $lc -notmatch '^(feds?|exit|quit|logout|clear|cmds|help)$' -and $rng.Next(0, 15) -eq 0) {
        Say '  > unusual activity detected...' Yellow
        Start-Sleep -Milliseconds 1200
        Invoke-Feds
        continue
    }

    switch -Regex ($lc) {
        '^sudo apt install opsec arch linux hello world print$' { Invoke-Opsec-Sequence; break }
        '^(cmds|help|\?)$' { Show-Cmds; break }
        '^feds?$' { Invoke-Feds; break }
        '^clear$' { Show-Banner; break }
        '^(exit|quit|logout)$' { Say 'logging out... deleting evidence... (kidding, nothing was ever saved)' DarkGray; return }
        '^whoami$' { Say 'anon (you are not anon, your hostname is literally your name)' Green; break }
        '^pwd$' { Say '/home/anon/definitely-not-fbi-folder' Gray; break }
        '^ls( .*)?$' {
            Say 'exploits/  totally_legal_stuff/  passwords.txt  opsec_notes.md  my_ip_dont_look.txt  MOM_WIFI_PASSWORD.txt  hoodie.png' Cyan
            break
        }
        '^cat passwords\.txt$' { Say 'hunter2' Gray; Say 'hunter3' Gray; Say 'password123' Gray; Say 'ilovemycat' Gray; break }
        '^cat opsec_notes\.md$' {
            Say '# OPSEC RULES' White
            Say '1. never tell anyone about opsec' Gray
            Say '2. tell everyone you do opsec' Gray
            Say '3. use mullvad (mention it often)' Gray
            Say '4. wear hoodie indoors' Gray
            Say '5. never use my real name (it is on my github)' Gray
            break
        }
        '^cat( .*)?$' { Say 'cat: file is classified. also it does not exist.' Gray; break }
        '^cd( .*)?$' { Say 'you are exactly where you need to be. also in a loop.' Gray; break }
        '^echo( .*)?$' { Say ($cmd.Substring(4).Trim()) White; break }
        '^hello world$' { Say 'Hello, World! You are now a hacker. Certificate pending.' Green; break }
        '^neofetch$' { Show-Neofetch; break }
        '^ifconfig$|^ip a$' {
            Say 'eth0: inet 127.0.0.1  netmask 255.0.0.0' Gray
            Say '      (that is localhost. you are hacking yourself.)' DarkGray
            Say 'wlan0: inet 192.168.0.69  ssid: "FBI Surveillance Van #4"' Gray
            break
        }
        '^history$' {
            $n = 1
            foreach ($h in $history) { Say ('{0,4}  {1}' -f $n, $h) Gray; $n++ }
            break
        }
        '^date$' { Say (Get-Date).ToString('ddd MMM dd HH:mm:ss yyyy') + ' (time to touch grass)'; break }
        '^uname( -a)?$' { Say 'Linux arch-btw 6.9.69-hacker #1 SMP PREEMPT_DYNAMIC x86_64 GNU/Linux (i use arch btw)' Gray; break }
        '^vpn$' {
            Say 'checking VPN layers...' Gray
            1..14 | ForEach-Object { Say ("  layer $_ : connected  [{0}]" -f ('sweden','iceland','a guy named Todd','mom''s router','the moon','switzerland','narnia')[$rng.Next(0,7)]) Green; Start-Sleep -Milliseconds 120 }
            Say 'ping increased to 4,000ms. worth it.' Yellow
            break
        }
        '^tor$' { Say 'Tor connected. Tor connected over VPN. VPN connected over Tor. Everyone is confused. Nobody is safe.' Green; break }
        '^opsec$' {
            Say 'running personal risk assessment...' Gray
            Start-Sleep -Milliseconds 700
            Say '  - uses same password everywhere ........ YES' Red
            Say '  - posted screenshot with taskbar ....... YES' Red
            Say '  - told the group chat "im basically a hacker" ... YES' Red
            Say '  - actual threat to anyone .............. NO' Green
            Say 'OPSEC SCORE: 3/100. bro. Use more VPN.' Yellow
            break
        }
        '^nmap( .*)?$' {
            $t = 'the Pentagon'
            if ($cmd.Length -gt 5) { $t = $cmd.Substring(5).Trim() }
            Say "Starting Nmap 7.94 ( https://nmap.org ) scanning $t" Gray
            Start-Sleep -Milliseconds 900
            Say 'PORT      STATE  SERVICE' White
            Say '22/tcp    open   ssh         (password: admin)' Green
            Say '80/tcp    open   http        (a picture of a cat)' Green
            Say '1337/tcp  open   elite       (you)' Green
            Say '8080/tcp  open   router-login (admin/admin lol)' Green
            Say "Scan complete. $t is your router." Yellow
            break
        }
        '^doxx( .*)?$' {
            $who = 'target'
            if ($cmd.Length -gt 5) { $who = $cmd.Substring(5).Trim() }
            Say "initiating FAKE doxx on '$who'..." Yellow
            Start-Sleep -Milliseconds 700
            Say 'searching the dark web... (googling)' Gray
            Start-Sleep -Milliseconds 700
            Say '  full name .......... [REDACTED] (we just asked their mom)' Gray
            Say '  address ............ 404 Not Found St' Gray
            Say '  ip ................. 127.0.0.1 (same as everyone)' Gray
            Say '  secrets ............ owns a cat named Mr. Whiskers' Gray
            Say '  dangerous? ......... only to a plate of nachos' Gray
            Say 'doxx complete. nothing real was found, because nothing here is real. be cool IRL.' Green
            break
        }
        '^hack( .*)?$' {
            $t = 'the planet'
            if ($cmd.Length -gt 5) { $t = $cmd.Substring(5).Trim() }
            Say "hacking $t..." Green
            1..20 | ForEach-Object { Write-Host '#' -NoNewline -ForegroundColor Green; Start-Sleep -Milliseconds 90 }
            Write-Host ''
            Say "ACCESS GRANTED to $t. you are in. (you are not in.)" Green
            break
        }
        '^ping( .*)?$' {
            $t = 'localhost'
            if ($cmd.Length -gt 5) { $t = $cmd.Substring(5).Trim() }
            1..4 | ForEach-Object { Say ("64 bytes from ${t}: icmp_seq=$_ ttl=64 time={0} ms (suspiciously fast)" -f $rng.Next(1,40)) Gray; Start-Sleep -Milliseconds 400 }
            break
        }
        '^rm -rf /.*$|^sudo rm -rf /.*$' {
            Say 'DELETING SYSTEM32...' Red
            Start-Sleep -Milliseconds 900
            Say 'just kidding. nothing happened. touch grass.' Green
            break
        }
        '^sudo apt install( .*)?$' {
            Say 'E: Unable to locate package. Did you mean: sudo apt install opsec arch linux hello world print ?' Yellow
            break
        }
        '^sudo( .*)?$' { Say 'anon is not in the sudoers file. This incident will be reported to... nobody. we do not have a server.' Red; break }
        '^(ssh|curl|wget)( .*)?$' { Say 'connection refused. the feds changed the locks.' Red; break }
        '^man( .*)?$' { Say 'no manual entry. read the source. (there is no source, this is a joke)' Gray; break }
        '^(vim|vi|nano)( .*)?$' { Say 'you opened an editor. you will never leave. goodbye.' Red; break }
        default { Say ("bash: {0}: command not found. try 'cmds', rookie." -f $cmd.Split(' ')[0]) Red }
    }
}
