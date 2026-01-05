<template>
    <div class="flex flex-col gap-2 sm:gap-3">
        <!-- Conference Header -->
        <div class="bg-gray-300 sm:rounded-xl p-2 sm:p-4 shadow-lg">
            <h2 class="text-center text-lg sm:text-2xl md:text-3xl font-black text-black tracking-wider">
                {{ props.conference.toUpperCase() }}
            </h2>
            <p class="text-center text-xs sm:text-sm text-slate-800 font-medium">
                {{ props.conference === 'afc' ? 'American Football Conference' : 'National Football Conference' }}
            </p>
        </div>
        
        <!-- Teams Grid -->
        <div class="grid grid-cols-1 gap-2 sm:gap-1">
            <NflLogo 
                v-for="team in teams" 
                :key="team.name"
                class="w-full" 
                :teamName="team.name"
                :rank="team.rank"
                :wins="team.wins"
                :losses="team.losses"
            />
        </div>
    </div>
</template>     

<script setup lang="ts">
    import NflLogo from '../NflLogo.vue';
     
    interface Team {
        name: string;
        rank: string;
        wins: number;
        losses: number;
    }
    
    interface Props {
        conference: 'afc' | 'nfc';
    }
    
    const props = defineProps<Props>();
    
    const afcTeams: Team[] = [
        { name: 'Chiefs', rank: '1', wins: 13, losses: 1 },
        { name: 'Bills', rank: '2', wins: 11, losses: 3 },
        { name: 'Steelers', rank: '3', wins: 10, losses: 4 },
        { name: 'Ravens', rank: '4', wins: 10, losses: 5 },
        { name: 'Texans', rank: '5', wins: 9, losses: 6 },
        { name: 'Chargers', rank: '6', wins: 9, losses: 6 },
        { name: 'Broncos', rank: '7', wins: 9, losses: 6 }
    ];
    
    const nfcTeams: Team[] = [
        { name: 'Eagles', rank: '1', wins: 14, losses: 0 },
        { name: 'Packers', rank: '2', wins: 12, losses: 2 },
        { name: '49ers', rank: '3', wins: 11, losses: 3 },
        { name: 'Cowboys', rank: '4', wins: 10, losses: 4 },
        { name: 'Lions', rank: '5', wins: 9, losses: 5 },
        { name: 'Seahawks', rank: '6', wins: 8, losses: 6 },
        { name: 'Rams', rank: '7', wins: 8, losses: 7 }
    ];
    
    const teams = props.conference === 'afc' ? afcTeams : nfcTeams;
</script>