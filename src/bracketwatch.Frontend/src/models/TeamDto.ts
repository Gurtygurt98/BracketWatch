export interface TeamDto {
    id: number
    name?: string 
    conference?: string
    wins?: number
    losses?: number
    pointsFor?: number
    pointsAgainst?: number
    gamesPlayed?: number
    strengthOfSchedule?: number
    rating?: number
    rank: string
}