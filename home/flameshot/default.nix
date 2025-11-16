{config, pkgs, ...}:
{
   services.flameshot.enable = true;
   services.flameshot.settings = {
       useGrimAdapter = true;

   };


}

