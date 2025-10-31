{config, ...}:
{
    programs.ssh.enable = true;
    programs.ssh.matchBlocks = {
        "vps" = {
            hostname = "5.181.51.191";
        };
    };
}
