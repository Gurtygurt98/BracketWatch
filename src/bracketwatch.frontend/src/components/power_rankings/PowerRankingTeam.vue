<template>
  <div>
    <button @click="loadPowerRankings"> Load Rankings </button>
    <ul>
      <li v-for="team in rankings" :key="team.rank">{{team.name}}</li>
    </ul>
  </div>
</template>
import {getPowerRankings} from '../services/'
