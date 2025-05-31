{
  pkgs,
  config,
  ...
}:
let
  colors = config.lib.stylix.colors;
  font = config.stylix.fonts.monospace;
  defaultCss = builtins.readFile ../styles/default.css;
in
{
  global = {
    theme = "dark";
    compactMode = true;
    floatingBar = true;
    noBarBg = false;
    noColorInData = true;
    bottomBar = false;
    sideDecoration = false;
    inlineSpacesOptions = false;
    disableAnimations = true;
    spacesBackgroundColorAsForeground = false;
    widgetsBackgroundColorAsForeground = true;
    widgetMaxWidth = "160px";
    slidingAnimationPace = 10;
    font = "${font.name}";
    fontSize = "11px";
    yabaiPath = "${pkgs.yabai}/bin/yabai";
    windowManager = "yabai";
    shell = "sh";
    terminal = "Terminal";
    disableNotifications = false;
    enableMissives = false;
    enableServer = false;
    serverSocketPort = 7777;
    yabaiServerRefresh = false;
    aerospaceServerRefresh = false;
    flashspaceServerRefresh = false;
    inlineSpaceOptions = false;
  };

  themes = {
    lightTheme = "CatppuccinLatte";
    darkTheme = "CatppuccinMocha";
    colorMain = "${colors.withHashtag.base00}";
    colorMainAlt = "${colors.withHashtag.base01}";
    colorMinor = "${colors.withHashtag.base03}";
    colorAccent = "${colors.withHashtag.base0E}";
    colorRed = "${colors.withHashtag.base08}";
    colorGreen = "${colors.withHashtag.base0B}";
    colorYellow = "${colors.withHashtag.base0A}";
    colorOrange = "${colors.withHashtag.base09}";
    colorBlue = "${colors.withHashtag.base0D}";
    colorMagenta = "${colors.withHashtag.base0F}";
    colorCyan = "${colors.withHashtag.base0C}";
    colorBlack = "";
    colorWhite = "${colors.withHashtag.base05}";
    colorForeground = "${colors.withHashtag.base05}";
    colorBackground = "${colors.withHashtag.base02}";
  };

  process = {
    showOnDisplay = "";
    displayOnlyCurrent = false;
    centered = false;
    showCurrentSpaceMode = false;
    hideWindowTitle = false;
    displayOnlyIcon = false;
    expandAllProcesses = false;
    displaySkhdMode = true;
    displayStackIndex = true;
    displayOnlyCurrentStack = false;
  };

  spacesDisplay = {
    showOnDisplay = "";
    exclusions = "";
    titleExclusions = "";
    spacesExclusions = "";
    exclusionsAsRegex = false;
    displayAllSpacesOnAllScreens = false;
    hideDuplicateAppsInSpaces = true;
    displayStickyWindowsSeparately = false;
    hideCreateSpaceButton = false;
    hideEmptySpaces = false;
    showOptionsOnHover = true;
    switchSpacesWithoutYabai = false;
    showOnlyFlashspaceSpaceIndex = false;
    hideFlashspaceAppIcons = false;
  };

  widgets = {
    processWidget = true;
    weatherWidget = true;
    netstatsWidget = false;
    cpuWidget = false;
    gpuWidget = false;
    memoryWidget = false;
    batteryWidget = true;
    wifiWidget = true;
    vpnWidget = false;
    zoomWidget = false;
    soundWidget = true;
    micWidget = false;
    dateWidget = true;
    timeWidget = true;
    keyboardWidget = false;
    spotifyWidget = false;
    cryptoWidget = false;
    stockWidget = false;
    youtubeMusicWidget = false;
    musicWidget = false;
    mpdWidget = false;
    browserTrackWidget = false;
  };

  weatherWidgetOptions = {
    refreshFrequency = 1800000;
    showOnDisplay = "";
    unit = "C";
    hideLocation = true;
    hideGradient = false;
    customLocation = "";
  };
  netstatsWidgetOptions = {
    refreshFrequency = 2000;
    showOnDisplay = "";
    displayAsGraph = true;
  };
  cpuWidgetOptions = {
    refreshFrequency = 2000;
    showOnDisplay = "";
    displayAsGraph = true;
    cpuMonitorApp = "Activity Monitor";
  };
  gpuWidgetOptions = {
    refreshFrequency = 3000;
    showOnDisplay = "";
    displayAsGraph = false;
    gpuMacmonBinaryPath = "/opt/homebrew/bin/macmon";
  };
  memoryWidgetOptions = {
    refreshFrequency = 4000;
    showOnDisplay = "";
    memoryMonitorApp = "Activity Monitor";
  };
  batteryWidgetOptions = {
    refreshFrequency = 10000;
    showOnDisplay = "";
    toggleCaffeinateOnClick = true;
    caffeinateOption = "";
  };
  networkWidgetOptions = {
    refreshFrequency = 20000;
    showOnDisplay = "";
    networkDevice = "en0";
    hideWifiIfDisabled = false;
    toggleWifiOnClick = true;
    hideNetworkName = true;
  };
  vpnWidgetOptions = {
    refreshFrequency = 8000;
    showOnDisplay = "";
    vpnConnectionName = "";
    vpnShowConnectionName = false;
  };
  zoomWidgetOptions = {
    refreshFrequency = 5000;
    showOnDisplay = "";
    showVideo = true;
    showMic = true;
  };
  soundWidgetOptions = {
    refreshFrequency = 20000;
    showOnDisplay = "";
  };
  micWidgetOptions = {
    refreshFrequency = 20000;
    showOnDisplay = "";
  };
  dateWidgetOptions = {
    refreshFrequency = 30000;
    showOnDisplay = "";
    shortDateFormat = true;
    locale = "en-US";
    calendarApp = "";
  };
  timeWidgetOptions = {
    refreshFrequency = 1000;
    showOnDisplay = "";
    hour12 = false;
    dayProgress = false;
    showSeconds = true;
  };
  keyboardWidgetOptions = {
    refreshFrequency = 20000;
    showOnDisplay = "";
  };
  cryptoWidgetOptions = {
    refreshFrequency = 300000;
    showOnDisplay = "";
    denomination = "usd";
    identifiers = "bitcoin;ethereum;celo";
    precision = 5;
  };
  stockWidgetOptions = {
    refreshFrequency = 900000;
    showOnDisplay = "";
    yahooFinanceApiKey = "";
    symbols = "AAPL;TSLA";
    showSymbol = true;
    showCurrency = true;
    showMarketPrice = true;
    showMarketChange = false;
    showMarketPercent = true;
    showColor = true;
  };
  spotifyWidgetOptions = {
    refreshFrequency = 10000;
    showOnDisplay = "";
    showSpecter = true;
  };
  youtubeMusicWidgetOptions = {
    refreshFrequency = 10000;
    showOnDisplay = "";
    showSpecter = true;
    youtubeMusicPort = 26538;
  };
  musicWidgetOptions = {
    refreshFrequency = 10000;
    showOnDisplay = "";
    showSpecter = true;
  };
  mpdWidgetOptions = {
    refreshFrequency = 10000;
    showOnDisplay = "";
    showSpecter = true;
    mpdBinaryPath = "/opt/homebrew/bin/mpc";
    mpdPort = 6600;
    mpdHost = "127.0.0.1";
    mpdFormatString = "%title%[ - %artist%]|[%file%]";
  };
  browserTrackWidgetOptions = {
    refreshFrequency = 10000;
    showOnDisplay = "";
    showSpecter = true;
  };
  customStyles = {
    styles = defaultCss;
  };
}
