<template>

    <p class="text-sm font-light text-white justify-left">
        {{ generatedParagraph }} 
    </p>

</template>

<script setup lang="ts">
    import { computed } from 'vue';  
    interface Props {
        conference: string
    }
    
    const afcGeneratedParagraph = `The AFC playoff picture is shaping up to be an exciting one this season. The Kansas City Chiefs are leading the pack with a stellar 13-1 record, showcasing their dominance on both sides of the ball. Hot on their heels are the Buffalo Bills, who have secured the second seed with an impressive 11-3 record. The Pittsburgh Steelers and Baltimore Ravens round out the top four, both boasting strong 10-4 and 10-5 records respectively. The Houston Texans, Los Angeles Chargers, and Denver Broncos complete the playoff picture, each fighting hard for their spot in the postseason with records of 9-6. As the regular season winds down, fans can expect thrilling matchups and intense competition as these teams vie for supremacy in the AFC.`;
    const nfcGeneratedParagraph = `The NFC playoff picture is shaping up to be an exciting one this season. The Philadelphia Eagles are leading the pack with an undefeated 14-0 record, showcasing their dominance on both sides of the ball. The Green Bay Packers follow closely behind with a strong 12-2 record, while the San Francisco 49ers hold the third seed with an impressive 11-3 record. The Dallas Cowboys round out the top four with a solid 10-4 record. The Detroit Lions, Seattle Seahawks, and Los Angeles Rams complete the playoff picture, each fighting hard for their spot in the postseason with records of 9-5, 8-6, and 8-7 respectively. As the regular season winds down, fans can expect thrilling matchups and intense competition as these teams vie for supremacy in the NFC.`;

    const props = defineProps<Props>()
    const generatedParagraph = props.conference === 'afc' ? afcGeneratedParagraph : nfcGeneratedParagraph;
</script>