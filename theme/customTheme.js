import colorsTheme from './colorsTheme';

export default {
    palette: {
        primary: {
            main: colorsTheme.bleu_hcl.primary,
            secondary: colorsTheme.bleu_hcl.secondary,
            light: colorsTheme.bleu_hcl.light,
            contrastText: colorsTheme.white.primary,
        },
        secondary: {
            main: colorsTheme.bleu_orage.primary,
        },
        info: {
            main: colorsTheme.bleu_pale.primary,
        },
        warning: {
            main: colorsTheme.orange.primary,
        },
        danger: {
            main: colorsTheme.red.primary,
        },
        success: {
            main: colorsTheme.green.primary,
        },
        neutral: {
            main: colorsTheme.gray.primary,
        },
        neutralDark: {
            main: colorsTheme.black.dark,
            secondary: colorsTheme.black.secondary,
            veryDark: colorsTheme.black.veryDark,
            dark: colorsTheme.black.dark,
            light: colorsTheme.black.light,
            lighter: colorsTheme.black.lighter,
            veryLight: colorsTheme.black.veryLight,
            transparent: colorsTheme.black.transparent,
        },
        text: {
            primary: colorsTheme.black.secondary,
            main: colorsTheme.black.secondary,
        },
        contrast: {
            main: colorsTheme.white.primary,
            light: colorsTheme.white.light,
        },
        contrastThreshold: 3,
    },
};
