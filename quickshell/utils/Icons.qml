pragma Singleton

import Quickshell
import Quickshell.Services.Notifications
import QtQuick

Singleton {
    id: root

    readonly property var categoryIcon: ({

        // ===== Top level =====
        AudioVideo: "disc-album",
        Audio: "list-music",
        Video: "video",
        Development: "code-xml",
        Education: "graduation-cap",
        Game: "gamepad-2",
        Graphics: "image",
        Network: "globe",
        Office: "briefcase",
        Science: "flask-conical",
        Settings: "cog",
        System: "cpu",
        Utility: "wrench",

        // ===== Development =====
        Building: "hammer",
        Debugger: "bug",
        IDE: "laptop",
        GUIDesigner: "layout-dashboard",
        Profiling: "activity",
        RevisionControl: "git-branch",
        Translation: "languages",
        WebDevelopment: "globe",

        // ===== Office =====
        Calendar: "calendar",
        ContactManagement: "book-user",
        Database: "database",
        Dictionary: "book-open",
        Chart: "chart-bar",
        Email: "mail",
        Finance: "wallet",
        FlowChart: "workflow",
        PDA: "smartphone",
        ProjectManagement: "square-kanban",
        Presentation: "presentation",
        Spreadsheet: "file-spreadsheet",
        WordProcessor: "file-text",

        // ===== Graphics =====
        "2DGraphics": "image",
        VectorGraphics: "pen-tool",
        RasterGraphics: "image-plus",
        "3DGraphics": "box",
        Scanning: "scan",
        OCR: "scan-text",
        Photography: "camera",
        Publishing: "printer",
        Viewer: "eye",

        // ===== Network =====
        Dialup: "phone",
        InstantMessaging: "message-circle",
        Chat: "message-square",
        IRCClient: "hash",
        Feed: "rss",
        FileTransfer: "upload",
        HamRadio: "radio",
        News: "newspaper",
        P2P: "share-2",
        RemoteAccess: "monitor-up",
        Telephony: "phone-call",
        TelephonyTools: "phone-forwarded",
        VideoConference: "video",

        // ===== Audio/Video =====
        Midi: "piano",
        Mixer: "sliders-horizontal",
        Sequencer: "list-ordered",
        Tuner: "gauge",
        TV: "tv",
        AudioVideoEditing: "scissors",
        Player: "circle-play",
        Recorder: "circle-dot",
        DiscBurning: "disc",

        // ===== Games =====
        ActionGame: "zap",
        AdventureGame: "compass",
        ArcadeGame: "joystick",
        BoardGame: "grid-3x3",
        BlocksGame: "square-stack",
        CardGame: "spade",
        KidsGame: "baby",
        LogicGame: "puzzle",
        RolePlaying: "swords",
        Shooter: "crosshair",
        Simulation: "cpu",
        SportsGame: "trophy",
        StrategyGame: "brain",
        LauncherStore: "shopping-bag",
        GameTool: "tool-case",

        // ===== Education / Science =====
        Art: "palette",
        Construction: "ruler",
        Music: "music",
        Languages: "languages",
        ArtificialIntelligence: "bot",
        Astronomy: "moon",
        Biology: "dna",
        Chemistry: "flask-round",
        ComputerScience: "square-terminal",
        DataVisualization: "chart-line",
        Economy: "coins",
        Electricity: "bolt",
        Geography: "map",
        Geology: "mountain",
        Geoscience: "earth",
        History: "scroll",
        Humanities: "book",
        ImageProcessing: "images",
        Literature: "book-text",
        Maps: "map-pin",
        Math: "calculator",
        NumericalAnalysis: "sigma",
        MedicalSoftware: "heart-pulse",
        Physics: "atom",
        Robotics: "cpu",
        Spirituality: "sparkles",
        Sports: "dumbbell",
        ParallelComputing: "server",

        // ===== Utility / System =====
        Amusement: "smile",
        Archiving: "archive",
        Compression: "package",
        Electronics: "circuit-board",
        Emulator: "monitor",
        Engineering: "compass",
        FileTools: "folder-cog",
        FileManager: "folder",
        TerminalEmulator: "terminal",
        Filesystem: "hard-drive",
        Monitor: "activity",
        Security: "shield",
        Accessibility: "accessibility",
        Calculator: "calculator",
        Clock: "clock",
        TextEditor: "file-pen",
        Documentation: "book-marked",

        // ===== Special =====
        Adult: "lock",
        Core: "star",

        // ===== Framework tags =====
        KDE: "layers",
        COSMIC: "sparkles",
        GNOME: "circle",
        LXQt: "box",
        XFCE: "feather",
        DDE: "layout-dashboard",
        GTK: "box",
        Qt: "square",
        Motif: "grid-3x3",
        Java: "coffee",
        ConsoleOnly: "terminal"
    })

    function getCategoryIcon(name: string): string {
        const categories = DesktopEntries.heuristicLookup(name)?.categories;

        if (categories) {
            for (const [key, value] of Object.entries(categoryIcon)) {
                if (categories.includes(key)) {
                    console.log("The DE category: ", key)
                    console.log("The chosen icon: ", value)
                    return value
                }
            }
        }
        return "app-window"
    }

    function getAppIcon(name: string): string {
        const icon  = DesktopEntries.heuristicLookup(name)?.icon;
        if (icon === "") {
            return Quickshell.iconPath("emblem-question")
        }
        return Quickshell.iconPath(icon);
    }
}
