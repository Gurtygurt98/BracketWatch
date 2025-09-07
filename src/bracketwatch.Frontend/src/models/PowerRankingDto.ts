import { TeamDto } from "@/models/TeamDto";

export class PowerRankingDto {
    rank : number = -1;
    team : TeamDto = new TeamDto();
}