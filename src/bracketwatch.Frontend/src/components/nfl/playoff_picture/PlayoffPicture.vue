<template>
    <div class="bg-gray-300 sm:rounded-xl p-2 sm:p-4 shadow-lg min-w-1/5">
        <!-- Conference Header -->
        <div class="text-center">
            <h2 class="text-center text-lg sm:text-2xl md:text-3xl font-black text-black tracking-wider">
                {{ props.conference.toUpperCase() }}
            </h2>
            <p class="text-center text-xs sm:text-sm text-slate-800 font-medium">
                {{ props.conference === 'afc' ? 'American Football Conference' : 'National Football Conference' }}
            </p>

        </div>
        <!-- Teams Grid -->
        <button @click="showStandings = !showStandings" class="">Toggle</button>
        <div v-if="showStandings" class="grid grid-cols-1 gap-2 sm:gap-1 p-1">
            <NflStandings :conference="props.conference" />
        </div>
        <div v-else class="h-48 flex items-center justify-center bg-gray-200 rounded-lg">
            <p class="text-gray-500 italic">Standings are currently unavailable.</p>

        </div>
        

    </div>
    <div class="grid grid-cols-1 gap-2 sm:gap-1">
        <NflPlayoffPictureDesc :conference="props.conference" />
    </div>
</template>     

<script setup lang="ts">
    import NflStandings from '@/components/nfl/NflStandings.vue';
    import NflPlayoffPictureDesc from '@/components/nfl/NflPlayoffPictureDesc.vue';
    import { ref, type Ref } from 'vue';
    interface Props {
        conference: 'afc' | 'nfc';
    }
    
    const props = defineProps<Props>();
    const showStandings: Ref<boolean> = ref(true)
    
</script>