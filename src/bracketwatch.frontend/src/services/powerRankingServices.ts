import axios from 'axios'

export async function getPowerRankings() {
  return await axios.get('/api/power_rankings/Get')
}
