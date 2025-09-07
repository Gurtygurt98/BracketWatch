// src/services/powerRankings.ts
import axios from 'axios';
import type { PowerRankingDto } from '@/models/PowerRankingDto'; // adjust path

const api = axios.create({
  baseURL: '/api', // or import.meta.env.VITE_API_BASE_URL
});

export async function loadPowerRankings(): Promise<PowerRankingDto[]> {
  const { data } = await api.get<PowerRankingDto[]>('/power_rankings/Get');
  return data;
}
