{ config, pkgs, ... }:
{
  programs.firefox = {
     policies = {  
      profiles = {
        erik = {
          id = "0";
          isDefault = true;
          settings = {
            "widget.use-xdg-desktop-portal.file-picker" = 1;
            "browser.aboutConfig.mediaffmpeg.vaapi.enabled" = true;
            "apz.overscroll.enabled" = "true";
            "general.smoothScroll" = "true";
            "general.smoothScroll.msdPhysics.continuousMotionMaxDeltaMS" = "12";
            "general.smoothScroll.msdPhysics.enabled" = true;
            "general.smoothScroll.msdPhysics.motionBeginSpringConstant" = "600";
            "general.smoothScroll.msdPhysics.regularSpringConstant" = "650";
            "general.smoothScroll.msdPhysics.slowdownMinDeltaMS" = "25";
            "general.smoothScroll.msdPhysics.slowdownMinDeltaRatio" = "2";
            "general.smoothScroll.msdPhysics.slowdownSpringConstant" = "250";
            "general.smoothScroll.currentVelocityWeighting" = "1";
            "general.smoothScroll.stopDecelerationWeighting" = "1";
            "mousewheel.default.delta_multiplier_y" = "300";
          };
        };
      };
    };
  };
}
