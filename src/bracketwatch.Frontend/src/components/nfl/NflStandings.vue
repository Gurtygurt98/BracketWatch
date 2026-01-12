<template>
    <div class="grid grid-cols-1 gap-10 sm:gap-3 p-2">

        <NflLogo 
            v-for="(team, index) in teams"
            :key="index"
            class="w-full" 
            :teamName="team.name ?? ''"
            :rank="team.rank ?? '0'"
            :wins="team.wins ?? -1"
            :losses="team.losses ?? -1"
            :clickable="true"
            @click="onTeamClicked(team.rank)"
        />
    </div>
</template>

<script setup lang="ts">
    import { computed } from 'vue'
    import NflLogo from '@/components/nfl/NflLogo.vue';
    import type { TeamDto } from '@/models/TeamDto';    
    interface Props {
        conference: string
    }
    const props = defineProps<Props>()
    const emit = defineEmits<{
        (e: 'team-clicked', rank: string, conference: string): void
    }>()
    const afcTeams: TeamDto[] = [
        { id: 1, name: 'Chiefs', rank: "1", wins: 13, losses: 1 },
        { id: 2, name: 'Bills', rank: "2", wins: 11, losses: 3 },
        { id: 3, name: 'Steelers', rank: "3", wins: 10, losses: 4 },
        { id: 4, name: 'Ravens', rank: "4", wins: 10, losses: 5 },
        { id: 5, name: 'Texans', rank: "5", wins: 9, losses: 6 },
        { id: 6, name: 'Chargers', rank: "6", wins: 9, losses: 6 },
        { id: 7, name: 'Broncos', rank: "7", wins: 9, losses: 6 }
    ];
    
    const nfcTeams: TeamDto[] = [
        { id: 8, name: 'Eagles', rank: "1", wins: 14, losses: 0 },
        { id: 9, name: 'Packers', rank: "2", wins: 12, losses: 2 },
        { id: 10, name: '49ers', rank: "3", wins: 11, losses: 3 },
        { id: 11, name: 'Cowboys', rank: "4", wins: 10, losses: 4 },
        { id: 12, name: 'Lions', rank: "5", wins: 9, losses: 5 },
        { id: 13, name: 'Seahawks', rank: "6", wins: 8, losses: 6 },
        { id: 14, name: 'Rams', rank: "7", wins: 8, losses: 7 }
    ];
    const teams: TeamDto[] = props.conference === 'afc' ? afcTeams : nfcTeams;
    function onTeamClicked(rank: string) {
    emit('team-clicked', rank, props.conference)
    }
</script>