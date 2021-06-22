self: super:
{
  obs-studio = super.obs-studio.overrideAttrs (old: {
    buildInputs = with super; [ ffmpeg-full ] ++ old.buildInputs;
  });
}
