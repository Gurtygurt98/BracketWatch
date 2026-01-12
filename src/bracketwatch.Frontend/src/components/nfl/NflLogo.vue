<template>
    <div class="p-2 cursor-pointer flex items-center gap-1 sm:gap-2 md:gap-4 p-2 sm:p-2 md:p-4 rounded-lg sm:rounded-xl shadow-lg bg-gradient-to-r from-gray-300 via-[var(--primary-color)] to-[var(--secondary-color)]" 
        :style="{ '--primary-color': teamColors.primary, '--secondary-color': teamColors.secondary }">
        <!-- Ranking Badge -->
        <div class="flex items-center justify-center w-9 h-9 sm:w-10 sm:h-10 md:w-12 md:h-12 rounded-lg flex-shrink-0">
            <span class="text-base sm:text-xl md:text-2xl font-black text-slate-900">#{{ rank }}</span>
        </div>
        
        <!-- Team Logo -->
        <img 
            :src="`/logos/nfl/${logoFile}`" 
            :alt="`${teamName} logo`" 
            class="w-9 h-9 sm:w-10 sm:h-10 md:w-16 md:h-16 object-contain drop-shadow-lg flex-shrink-0" 
        />
        
        <!-- Team Name and Record -->
        <div class="flex flex-col min-w-0 flex-1">
            <span class="text-sm sm:text-sm md:text-lg font-bold text-black tracking-wide truncate">{{ teamName }}</span>
            <span class="text-xs sm:text-xs text-slate-800 truncate">{{ wins }}-{{ losses }}</span>
        </div>
        
        <!-- Wins/Losses - HIDDEN ON MOBILE -->
        <div class="hidden sm:flex items-center gap-1 md:gap-3 flex-shrink-0">
            <div class="flex flex-col items-center min-w-[2rem] md:min-w-[3rem]">
                <span class="text-xs text-slate-300 font-medium">W</span>
                <span class="text-base md:text-xl font-bold text-white">{{ wins }}</span>
            </div>
            <div class="text-slate-400 text-base md:text-xl font-light">-</div>
            <div class="flex flex-col items-center min-w-[2rem] md:min-w-[3rem]">
                <span class="text-xs text-slate-300 font-medium">L</span>
                <span class="text-base md:text-xl font-bold text-white">{{ losses }}</span>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
    interface Props {
        teamName: string
        rank: string
        wins: number
        losses: number
    }
    const props = defineProps<Props>()

    interface TeamInfo {
        logo: string
        primary: string
        secondary: string
        city: string
    }

    // Team mappings with colors
   const teamMappings: Record<string, TeamInfo> = {
        'Steelers': {
            logo: 'pittsburgh-steelers.svg',
            primary: '#FFB612',
            secondary: '#000000',
            city: 'Pittsburgh'
        },
        'Chiefs': {
            logo: 'kansas-city-chiefs.svg',
            primary: '#E31837',
            secondary: '#FFB81C',
            city: 'Kansas City'
        },
        'Cowboys': {
            logo: 'dallas-cowboys.svg',
            primary: '#041E42',
            secondary: '#869397',
            city: 'Dallas'
        },
        'Packers': {
            logo: 'green-bay-packers.svg',
            primary: '#203731',
            secondary: '#FFB612',
            city: 'Green Bay'
        },
        '49ers': {
            logo: 'san-francisco-49ers.svg',
            primary: '#AA0000',
            secondary: '#B3995D',
            city: 'San Francisco'
        },
        'Patriots': {
            logo: 'new-england-patriots.svg',
            primary: '#002244',
            secondary: '#C60C30',
            city: 'New England'
        },
        'Eagles': {
            logo: 'philadelphia-eagles.svg',
            primary: '#004C54',
            secondary: '#A5ACAF',
            city: 'Philadelphia'
        },
        'Ravens': {
            logo: 'baltimore-ravens.svg',
            primary: '#241773',
            secondary: '#000000',
            city: 'Baltimore'
        },
        'Bills': {
            logo: 'buffalo-bills.svg',
            primary: '#00338D',
            secondary: '#C60C30',
            city: 'Buffalo'
        },
        'Bengals': {
            logo: 'cincinnati-bengals.svg',
            primary: '#FB4F14',
            secondary: '#000000',
            city: 'Cincinnati'
        },
        'Dolphins': {
            logo: 'miami-dolphins.svg',
            primary: '#008E97',
            secondary: '#FC4C02',
            city: 'Miami'
        },
        'Jets': {
            logo: 'new-york-jets.svg',
            primary: '#125740',
            secondary: '#000000',
            city: 'New York'
        },
        'Texans': {
            logo: 'houston-texans.svg',
            primary: '#03202F',
            secondary: '#A71930',
            city: 'Houston'
        },
        'Colts': {
            logo: 'indianapolis-colts.svg',
            primary: '#002C5F',
            secondary: '#A2AAAD',
            city: 'Indianapolis'
        },
        'Jaguars': {
            logo: 'jacksonville-jaguars.svg',
            primary: '#006778',
            secondary: '#D7A22A',
            city: 'Jacksonville'
        },
        'Titans': {
            logo: 'tennessee-titans.svg',
            primary: '#0C2340',
            secondary: '#4B92DB',
            city: 'Tennessee'
        },
        'Broncos': {
            logo: 'denver-broncos.svg',
            primary: '#FB4F14',
            secondary: '#002244',
            city: 'Denver'
        },
        'Raiders': {
            logo: 'las-vegas-raiders.svg',
            primary: '#000000',
            secondary: '#A5ACAF',
            city: 'Las Vegas'
        },
        'Chargers': {
            logo: 'los-angeles-chargers.svg',
            primary: '#0080C6',
            secondary: '#FFC20E',
            city: 'Los Angeles'
        },
        'Giants': {
            logo: 'new-york-giants.svg',
            primary: '#0B2265',
            secondary: '#A71930',
            city: 'New York'
        },
        'Commanders': {
            logo: 'washington-commanders.svg',
            primary: '#5A1414',
            secondary: '#FFB612',
            city: 'Washington'
        },
        'Bears': {
            logo: 'chicago-bears.svg',
            primary: '#0B162A',
            secondary: '#C83803',
            city: 'Chicago'
        },
        'Lions': {
            logo: 'detroit-lions.svg',
            primary: '#0076B6',
            secondary: '#B0B7BC',
            city: 'Detroit'
        },
        'Vikings': {
            logo: 'minnesota-vikings.svg',
            primary: '#4F2683',
            secondary: '#FFC62F',
            city: 'Minnesota'
        },
        'Buccaneers': {
            logo: 'tampa-bay-buccaneers.svg',
            primary: '#D50A0A',
            secondary: '#34302B',
            city: 'Tampa Bay'
        },
        'Saints': {
            logo: 'new-orleans-saints.svg',
            primary: '#D3BC8D',
            secondary: '#101820',
            city: 'New Orleans'
        },
        'Falcons': {
            logo: 'atlanta-falcons.svg',
            primary: '#A71930',
            secondary: '#000000',
            city: 'Atlanta'
        },
        'Panthers': {
            logo: 'carolina-panthers.svg',
            primary: '#0085CA',
            secondary: '#101820',
            city: 'Carolina'
        },
        'Rams': {
            logo: 'los-angeles-rams.svg',
            primary: '#003594',
            secondary: '#FFA300',
            city: 'Los Angeles'
        },
        'Seahawks': {
            logo: 'seattle-seahawks.svg',
            primary: '#002244',
            secondary: '#69BE28',
            city: 'Seattle'
        },
        'Cardinals': {
            logo: 'arizona-cardinals.svg',
            primary: '#97233F',
            secondary: '#000000',
            city: 'Arizona'
        }
    };

    const teamInfo = teamMappings[props.teamName] || {
        logo: 'nfl-logo.svg',
        primary: '#013369',
        secondary: '#D50A0A',
        city: 'NFL'
    }

    const logoFile = teamInfo.logo
    const teamColors = {
        primary: teamInfo.primary,
        secondary: teamInfo.secondary,
        city: teamInfo.city
    }
</script>