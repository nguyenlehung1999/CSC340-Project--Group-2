package L.FPet.LFPet.SystemAdmin;

import L.FPet.LFPet.CommunityMember.CommunityMember;
import L.FPet.LFPet.LostPetOwner.LostPetOwner;
import L.FPet.LFPet.Review.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdminRepository extends JpaRepository<SystemAdmin, Integer> {

    @Query(value = "SELECT * FROM communitymember ORDER BY join_date DESC;", nativeQuery = true)
    List<CommunityMember> recentMemberAccounts();

    @Query(value = "SELECT * FROM lostpetowner ORDER BY join_date DESC;", nativeQuery = true)
    List<LostPetOwner> recentOwnerAccounts();

    @Query(value = """
    SELECT l.lost_reportid   AS report_id,
           l.petid           AS pet_id,
           l.status          AS status,
           l.lost_location   AS location,
           l.createdat       AS created_at,
           l.last_seen        AS last_seen_time,
           'Lost'             AS type
    FROM lostpetreport l

    UNION ALL

    SELECT f.found_reportid  AS report_id,
           f.petid           AS pet_id,
           f.status          AS status,
           f.found_location  AS location,
           f.createdat       AS created_at,
           f.found_date      AS last_seen_time,
           'Found'           AS type
    FROM foundpetreport f

    ORDER BY created_at
    """, nativeQuery = true)
    List<Object> allReports();
}
