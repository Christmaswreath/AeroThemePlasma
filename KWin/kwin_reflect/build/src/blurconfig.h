// This file is generated by kconfig_compiler_kf5 from blur.kcfg.
// All changes you do to this file will be lost.
#ifndef KWIN_BLURCONFIG_H
#define KWIN_BLURCONFIG_H

#include <kconfigskeleton.h>
#include <QCoreApplication>
#include <QDebug>

namespace KWin {

class BlurConfig : public KConfigSkeleton
{
  public:

    static BlurConfig *self();
    static void instance(const QString& cfgfilename);
    static void instance(KSharedConfig::Ptr config);
    ~BlurConfig() override;

    /**
      Set BlurStrength
    */
    static
    void setBlurStrength( int v )
    {
      if (!self()->isBlurStrengthImmutable())
        self()->mBlurStrength = v;
    }

    /**
      Get BlurStrength
    */
    static
    int blurStrength()
    {
      return self()->mBlurStrength;
    }

    /**
      Is BlurStrength Immutable
    */
    static
    bool isBlurStrengthImmutable()
    {
      return self()->isImmutable( QStringLiteral( "BlurStrength" ) );
    }

    /**
      Set NoiseStrength
    */
    static
    void setNoiseStrength( int v )
    {
      if (!self()->isNoiseStrengthImmutable())
        self()->mNoiseStrength = v;
    }

    /**
      Get NoiseStrength
    */
    static
    int noiseStrength()
    {
      return self()->mNoiseStrength;
    }

    /**
      Is NoiseStrength Immutable
    */
    static
    bool isNoiseStrengthImmutable()
    {
      return self()->isImmutable( QStringLiteral( "NoiseStrength" ) );
    }

    /**
      Set TranslateTexture
    */
    static
    void setTranslateTexture( bool v )
    {
      if (!self()->isTranslateTextureImmutable())
        self()->mTranslateTexture = v;
    }

    /**
      Get TranslateTexture
    */
    static
    bool translateTexture()
    {
      return self()->mTranslateTexture;
    }

    /**
      Is TranslateTexture Immutable
    */
    static
    bool isTranslateTextureImmutable()
    {
      return self()->isImmutable( QStringLiteral( "TranslateTexture" ) );
    }

    /**
      Set EnableColorization
    */
    static
    void setEnableColorization( bool v )
    {
      if (!self()->isEnableColorizationImmutable())
        self()->mEnableColorization = v;
    }

    /**
      Get EnableColorization
    */
    static
    bool enableColorization()
    {
      return self()->mEnableColorization;
    }

    /**
      Is EnableColorization Immutable
    */
    static
    bool isEnableColorizationImmutable()
    {
      return self()->isImmutable( QStringLiteral( "EnableColorization" ) );
    }

    /**
      Set TextureLocation
    */
    static
    void setTextureLocation( const QString & v )
    {
      if (!self()->isTextureLocationImmutable())
        self()->mTextureLocation = v;
    }

    /**
      Get TextureLocation
    */
    static
    QString textureLocation()
    {
      return self()->mTextureLocation;
    }

    /**
      Is TextureLocation Immutable
    */
    static
    bool isTextureLocationImmutable()
    {
      return self()->isImmutable( QStringLiteral( "TextureLocation" ) );
    }

    /**
      Set ExcludedWindows
    */
    static
    void setExcludedWindows( const QString & v )
    {
      if (!self()->isExcludedWindowsImmutable())
        self()->mExcludedWindows = v;
    }

    /**
      Get ExcludedWindows
    */
    static
    QString excludedWindows()
    {
      return self()->mExcludedWindows;
    }

    /**
      Is ExcludedWindows Immutable
    */
    static
    bool isExcludedWindowsImmutable()
    {
      return self()->isImmutable( QStringLiteral( "ExcludedWindows" ) );
    }

    /**
      Set ExcludedColorization
    */
    static
    void setExcludedColorization( const QString & v )
    {
      if (!self()->isExcludedColorizationImmutable())
        self()->mExcludedColorization = v;
    }

    /**
      Get ExcludedColorization
    */
    static
    QString excludedColorization()
    {
      return self()->mExcludedColorization;
    }

    /**
      Is ExcludedColorization Immutable
    */
    static
    bool isExcludedColorizationImmutable()
    {
      return self()->isImmutable( QStringLiteral( "ExcludedColorization" ) );
    }

    /**
      Set CustomColor
    */
    static
    void setCustomColor( const QString & v )
    {
      if (!self()->isCustomColorImmutable())
        self()->mCustomColor = v;
    }

    /**
      Get CustomColor
    */
    static
    QString customColor()
    {
      return self()->mCustomColor;
    }

    /**
      Is CustomColor Immutable
    */
    static
    bool isCustomColorImmutable()
    {
      return self()->isImmutable( QStringLiteral( "CustomColor" ) );
    }

    /**
      Set AccentColor
    */
    static
    void setAccentColor( const QString & v )
    {
      if (!self()->isAccentColorImmutable())
        self()->mAccentColor = v;
    }

    /**
      Get AccentColor
    */
    static
    QString accentColor()
    {
      return self()->mAccentColor;
    }

    /**
      Is AccentColor Immutable
    */
    static
    bool isAccentColorImmutable()
    {
      return self()->isImmutable( QStringLiteral( "AccentColor" ) );
    }

    /**
      Set AccentColorName
    */
    static
    void setAccentColorName( int v )
    {
      if (!self()->isAccentColorNameImmutable())
        self()->mAccentColorName = v;
    }

    /**
      Get AccentColorName
    */
    static
    int accentColorName()
    {
      return self()->mAccentColorName;
    }

    /**
      Is AccentColorName Immutable
    */
    static
    bool isAccentColorNameImmutable()
    {
      return self()->isImmutable( QStringLiteral( "AccentColorName" ) );
    }

    /**
      Set EnableTransparency
    */
    static
    void setEnableTransparency( bool v )
    {
      if (!self()->isEnableTransparencyImmutable())
        self()->mEnableTransparency = v;
    }

    /**
      Get EnableTransparency
    */
    static
    bool enableTransparency()
    {
      return self()->mEnableTransparency;
    }

    /**
      Is EnableTransparency Immutable
    */
    static
    bool isEnableTransparencyImmutable()
    {
      return self()->isImmutable( QStringLiteral( "EnableTransparency" ) );
    }

  protected:
    BlurConfig(KSharedConfig::Ptr config);
    friend class BlurConfigHelper;


    // Effect-Reflection
    int mBlurStrength;
    int mNoiseStrength;
    bool mTranslateTexture;
    bool mEnableColorization;
    QString mTextureLocation;
    QString mExcludedWindows;
    QString mExcludedColorization;
    QString mCustomColor;
    QString mAccentColor;
    int mAccentColorName;
    bool mEnableTransparency;

  private:
};

}

#endif
