#!/usr/bin/env bash
# LARPOS (bash edition) - fake hacker terminal. Parody only. Does nothing real.

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
IMG="$DIR/assets/LARPOPSEC.webp"
G=$'\e[32m'; DG=$'\e[2;32m'; R=$'\e[31m'; Y=$'\e[33m'; C=$'\e[36m'; M=$'\e[35m'; W=$'\e[97m'; GR=$'\e[90m'; N=$'\e[0m'

say() { printf '%s%s%s\n' "$2" "$1" "$N"; }
typeit() { local s="$1" c="${2:-$G}" d="${3:-0.035}" i; printf '%s' "$c"; for ((i=0;i<${#s};i++)); do printf '%s' "${s:i:1}"; sleep "$d"; done; printf '%s\n' "$N"; }

banner() {
  clear
  say '  _      _   ___ ___   ___  ___ ' "$G"
  say " | |    /_\\ | _ \\ _ \\ / _ \\/ __|" "$G"
  say ' | |__ / _ \|   /  _/| (_) \__ \' "$G"
  say ' |____/_/ \_\_|_\_|   \___/|___/' "$G"
  echo
  say ' LARPOS v1.0 "Definitely Not A Raspberry Pi" Edition' "$GR"
  say ' Type "cmds" to see everything you can pretend to do.' "$GR"
  echo
}

cmds() {
  echo; say '  === AVAILABLE COMMANDS (all fake, like your threat model) ===' "$C"; echo
  while IFS='|' read -r a b; do printf '  %s%-52s%s- %s\n' "$Y" "$a" "$N" "$b"; done <<'EOF'
cmds / help|this menu, genius
sudo apt install opsec arch linux hello world print|the real one. you know what it does
whoami|find out who you really are (not much)
neofetch|flex your totally-Arch machine
nmap <target>|scan the Pentagon (it is your router)
doxx <name>|doxx someone (spoiler: you get their cat)
vpn|check your 14 layers of VPN
tor|tor over vpn over tor over vpn
opsec|a risk assessment of you
hack <target>|hack the planet
ls / pwd / cat <f>|look around your very real files
ping <host>|ping literally anyone
ifconfig|your IP is 127.0.0.1 bro it is fine
echo <text>|say things
history|what have you been doing
feds|summon the feds (they also show up randomly)
rm -rf /|try it. we dare you.
hello world|classic
clear / exit|leave the matrix
EOF
  echo
}

arch_logo() { cat <<'EOF'
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
EOF
}

mullvad() {
  say '   +-----------------------------------+' "$Y"
  say '   |   M U L L V A D   V P N            |' "$Y"
  say '   |   [ CONNECTED - sweden, probably ] |' "$G"
  say '   +-----------------------------------+' "$Y"
}

open_img() {
  if [ ! -f "$IMG" ]; then say "  (missing $IMG - opsec failure)" "$R"; return; fi
  local page; page="$(mktemp -t larpopsec.XXXXXX).html"
  cat > "$page" <<EOF
<!doctype html><html><head><meta charset="utf-8"><title>LARPOPSEC</title>
<style>html,body{margin:0;height:100%;background:#000;color:#0f0;font-family:monospace;text-align:center}
img{max-width:92vw;max-height:84vh;border:2px solid #0f0;box-shadow:0 0 40px #0f0}
h1{margin:14px 0 10px;letter-spacing:4px;text-shadow:0 0 12px #0f0}p{color:#0a0}</style></head><body>
<h1>WELCOME TO DOXBIN OPSEC SUDO BRADAR</h1><img src="file://$IMG">
<p>[ certified elite &bull; 0 real hackers were involved ]</p></body></html>
EOF
  if command -v xdg-open >/dev/null; then xdg-open "$page" >/dev/null 2>&1 &
  elif command -v open >/dev/null; then open "$page" >/dev/null 2>&1 &
  else say "  open this in a browser: $page" "$GR"; fi
}

feds() {
  local msgs=("FBI OPEN UP" "WE KNOW WHAT YOU DID" "NICE OPSEC, BRADAR" "STEP AWAY FROM THE KEYBOARD" "WEEE-OOO WEEE-OOO")
  local cols lines f bg msg pad
  cols=$(tput cols); lines=$(tput lines)
  for ((f=0;f<14;f++)); do
    if ((f%2==0)); then bg=$'\e[41m'; else bg=$'\e[44m'; fi
    printf '%s\e[2J\e[H' "$bg"
    msg="${msgs[$((f%5))]}"; pad=$(( (cols-${#msg})/2 )); ((pad<0)) && pad=0
    printf '\e[%d;%dH\e[1;97m%s' $((lines/2)) $((pad+1)) "$msg"
    printf '\a'; sleep 0.2
  done
  printf '%s\e[2J\e[H' "$N"
  say '  ...' "$GR"; sleep 1.2
  say '  jk it was the pizza guy. he has a warrant for your pizza.' "$G"
  say '  (nothing is real. no feds. go outside.)' "$GR"; echo
}

opsec_seq() {
  echo; say '[sudo] password for anon: ********' "$GR"; sleep 0.7
  say 'Reading package lists... Done' "$GR"; sleep 0.4
  say 'Building dependency tree... Done' "$GR"; sleep 0.4
  say 'The following NEW packages will be installed:' "$GR"
  say '  opsec arch-linux-btw hello-world-print paranoia-lite mullvad-vpn tinfoil-hat' "$GR"; sleep 0.6
  say 'Need to get 0 B of archives. After this operation, your ego will use 9001 GB.' "$GR"; sleep 0.8
  say 'Disabling brain... ' "$Y"; sleep 0.6
  say 'Enabling hoodie... done' "$Y"; sleep 0.6
  say 'INITIATING HACKER SEQUENCE. DO NOT LOOK DIRECTLY AT THE CODE.' "$R"; sleep 1.2
  clear
  local w=$(( $(tput cols) - 2 )) phrases=("BYPASSING FIREWALL" "INJECTING SQL INTO THE MAINFRAME" "DECRYPTING THE GIBSON" "ACCESS GRANTED" "ROOT OBTAINED" "DOWNLOADING MORE RAM" "ENCRYPTING MY BROWSER HISTORY" "ASKING CHATGPT HOW TO HACK" "PORT 1337 OPEN" "IM IN" "TRACING IP: 127.0.0.1" "COMPILING KERNEL (BTW)")
  local end=$((SECONDS+10)) i line m
  while ((SECONDS<end)); do
    m=$((RANDOM%10)); line=""
    if ((m<6)); then for ((i=0;i<w;i++)); do line+=$((RANDOM%2)); done; printf '%s%s%s\n' "$DG" "$line" "$N"
    elif ((m<8)); then for ((i=0;i<w/5;i++)); do line+=$(printf '0x%02X ' $((RANDOM%256))); done; printf '%s%s%s\n' "$G" "$line" "$N"
    else printf '%s[%08X] %s%s\n' "$W" $((RANDOM*RANDOM)) "${phrases[RANDOM%${#phrases[@]}]}" "$N"; fi
    sleep 0.02
  done
  clear
  printf '%s%s%s\n' "$C" "$(arch_logo)" "$N"
  say '          A R C H   L I N U X   (I use Arch btw)' "$C"; echo
  mullvad; echo; sleep 0.9
  typeit '  > opsec level: MAXIMUM (self-reported)' "$G" 0.03
  typeit '  > threat model: my little brother' "$G" 0.03
  typeit '  > feds notified: 0 (they were not invited)' "$G" 0.03
  echo; sleep 0.7
  typeit '  WELCOME TO DOXBIN OPSEC SUDO BRADAR' "$M" 0.07
  echo; open_img
  say '  (image opened in your browser. type "cmds" to keep LARPing)' "$GR"; echo
  sleep 7; say '  > incoming connection from 192.168.0.1 ...' "$Y"; sleep 1.5; feds
}

neofetch() {
  local info=("anon@arch-btw" "-------------" "OS: Arch Linux (in spirit)" "Host: Dell Optiplex from 2011" "Kernel: 6.9.69-hacker" "Shell: zsh (rewritten in my head)" "VPNs: 14" "Threat Model: Mom" "Packages: 3 (opsec, hoodie, vibes)")
  local i=0 l
  while IFS= read -r l; do
    printf '%s%-38s%s%s\n' "$C" "$l" "$W" "${info[i]}"; ((i++)); ((i>=9)) && break
  done < <(arch_logo | head -9)
  printf '%s' "$N"
}

hist=()
cwd="~"
banner
while true; do
  printf '%sanon%s@%sarch%s:%s$ ' "$G" "$W" "$C" "$W" "$cwd"; printf '%s' "$N"
  IFS= read -r raw || break
  cmd="$(printf '%s' "$raw" | tr -s ' ' | sed 's/^ *//;s/ *$//')"
  [ -z "$cmd" ] && continue
  hist+=("$cmd"); lc="${cmd,,}"; first="${lc%% *}"; rest="${cmd#* }"; [ "$rest" = "$cmd" ] && rest=""
  if ((${#hist[@]}>3 && RANDOM%15==0)) && [[ ! "$lc" =~ ^(feds?|exit|quit|logout|clear|cmds|help)$ ]]; then
    say '  > unusual activity detected...' "$Y"; sleep 1.2; feds; continue
  fi
  case "$lc" in
    "sudo apt install opsec arch linux hello world print") opsec_seq ;;
    cmds|help|"?") cmds ;;
    fed|feds) feds ;;
    clear) banner ;;
    exit|quit|logout) say 'logging out... deleting evidence... (kidding, nothing was ever saved)' "$GR"; exit 0 ;;
    whoami) say 'anon (you are not anon, your hostname is literally your name)' "$G" ;;
    pwd) say '/home/anon/definitely-not-fbi-folder' "$GR" ;;
    ls|ls\ *) say 'exploits/  totally_legal_stuff/  passwords.txt  opsec_notes.md  my_ip_dont_look.txt  MOM_WIFI_PASSWORD.txt  hoodie.png' "$C" ;;
    "cat passwords.txt") printf 'hunter2\nhunter3\npassword123\nilovemycat\n' ;;
    "cat opsec_notes.md") printf '# OPSEC RULES\n1. never tell anyone about opsec\n2. tell everyone you do opsec\n3. use mullvad (mention it often)\n4. wear hoodie indoors\n5. never use my real name (it is on my github)\n' ;;
    cat|cat\ *) say 'cat: file is classified. also it does not exist.' "$GR" ;;
    cd|cd\ *) say 'you are exactly where you need to be. also in a loop.' "$GR" ;;
    echo|echo\ *) echo "$rest" ;;
    "hello world") say 'Hello, World! You are now a hacker. Certificate pending.' "$G" ;;
    neofetch) neofetch ;;
    ifconfig|"ip a") say 'eth0: inet 127.0.0.1  netmask 255.0.0.0'; say '      (that is localhost. you are hacking yourself.)' "$GR"; say 'wlan0: inet 192.168.0.69  ssid: "FBI Surveillance Van #4"' ;;
    history) n=1; for h in "${hist[@]}"; do printf '%4d  %s\n' $n "$h"; ((n++)); done ;;
    date) echo "$(date '+%a %b %d %H:%M:%S %Y') (time to touch grass)" ;;
    uname|"uname -a") say 'Linux arch-btw 6.9.69-hacker #1 SMP PREEMPT_DYNAMIC x86_64 GNU/Linux (i use arch btw)' ;;
    vpn) say 'checking VPN layers...'; places=(sweden iceland "a guy named Todd" "mom's router" "the moon" switzerland narnia)
         for i in $(seq 1 14); do say "  layer $i : connected  [${places[RANDOM%7]}]" "$G"; sleep 0.12; done; say 'ping increased to 4,000ms. worth it.' "$Y" ;;
    tor) say 'Tor connected. Tor connected over VPN. VPN connected over Tor. Everyone is confused. Nobody is safe.' "$G" ;;
    opsec) say 'running personal risk assessment...'; sleep 0.7
         say '  - uses same password everywhere ........ YES' "$R"; say '  - posted screenshot with taskbar ....... YES' "$R"
         say '  - told the group chat "im basically a hacker" ... YES' "$R"; say '  - actual threat to anyone .............. NO' "$G"
         say 'OPSEC SCORE: 3/100. bro. Use more VPN.' "$Y" ;;
    nmap|nmap\ *) t="${rest:-the Pentagon}"; say "Starting Nmap 7.94 scanning $t"; sleep 0.9
         say 'PORT      STATE  SERVICE' "$W"; say '22/tcp    open   ssh         (password: admin)' "$G"
         say '80/tcp    open   http        (a picture of a cat)' "$G"; say '1337/tcp  open   elite       (you)' "$G"
         say '8080/tcp  open   router-login (admin/admin lol)' "$G"; say "Scan complete. $t is your router." "$Y" ;;
    doxx|doxx\ *) t="${rest:-target}"; say "initiating FAKE doxx on '$t'..." "$Y"; sleep 0.7; say 'searching the dark web... (googling)'; sleep 0.7
         say '  full name .......... [REDACTED] (we just asked their mom)'; say '  address ............ 404 Not Found St'
         say '  ip ................. 127.0.0.1 (same as everyone)'; say '  secrets ............ owns a cat named Mr. Whiskers'
         say '  dangerous? ......... only to a plate of nachos'
         say 'doxx complete. nothing real was found, because nothing here is real. be cool IRL.' "$G" ;;
    hack|hack\ *) t="${rest:-the planet}"; say "hacking $t..." "$G"; for i in $(seq 1 20); do printf '%s#%s' "$G" "$N"; sleep 0.09; done; echo
         say "ACCESS GRANTED to $t. you are in. (you are not in.)" "$G" ;;
    ping|ping\ *) t="${rest:-localhost}"; for i in 1 2 3 4; do echo "64 bytes from $t: icmp_seq=$i ttl=64 time=$((RANDOM%40+1)) ms (suspiciously fast)"; sleep 0.4; done ;;
    "rm -rf /"*|"sudo rm -rf /"*) say 'DELETING SYSTEM32...' "$R"; sleep 0.9; say 'just kidding. nothing happened. touch grass.' "$G" ;;
    "sudo apt install"*) say 'E: Unable to locate package. Did you mean: sudo apt install opsec arch linux hello world print ?' "$Y" ;;
    sudo|sudo\ *) say 'anon is not in the sudoers file. This incident will be reported to... nobody. we do not have a server.' "$R" ;;
    ssh*|curl*|wget*) say 'connection refused. the feds changed the locks.' "$R" ;;
    man|man\ *) say 'no manual entry. read the source. (there is no source, this is a joke)' "$GR" ;;
    vim*|vi|vi\ *|nano*) say 'you opened an editor. you will never leave. goodbye.' "$R" ;;
    *) say "bash: ${first}: command not found. try 'cmds', rookie." "$R" ;;
  esac
done
