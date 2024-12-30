-- 노선별 평균 역 사이 거리 조회하기
SELECT route, concat(round(sum(D_BETWEEN_DIST),1),'km') as total_distance, concat(round(avg(d_between_dist),2),'km') as average_distance
FROM subway_distance
GROUP BY route
order by total_distance*1 desc