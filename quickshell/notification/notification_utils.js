/**
 * @param { string } summary 
 * @returns { string }
 */
function findSuitableMaterialSymbol(summary = "") {
    const defaultType = 'chat';
    if(summary.length === 0) return defaultType;

    const keywordsToTypes = {
        'reboot': 'restart_alt',
        'recording': 'screen_record',
        'battery': 'power',
        'power': 'power',
        'screenshot': 'screenshot_monitor',
        'welcome': 'waving_hand',
        'time': 'scheduleb',
        'installed': 'download',
        'configuration reloaded': 'reset_wrench',
        'config': 'reset_wrench',
        'update': 'update',
        'ai response': 'neurology',
        'control': 'settings',
        'upscale': 'compare',
        'install': 'deployed_code_update',
        'startswith:file': 'folder_copy', // Declarative startsWith check
    };

    const lowerSummary = summary.toLowerCase();

    for (const [keyword, type] of Object.entries(keywordsToTypes)) {
        if (keyword.startsWith('startswith:')) {
            const startsWithKeyword = keyword.replace('startswith:', '');
            if (lowerSummary.startsWith(startsWithKeyword)) {
                return type;
            }
        } else if (lowerSummary.includes(keyword)) {
            return type;
        }
    }

    return defaultType;
}
