SELECT
  organizations.id AS searchable_id,
  'Organization' AS searchable_type,
  organizations.name AS term
FROM organizations

UNION

SELECT
  ridings.id AS searchable_id,
  'Riding' AS searchable_type,
  ridings.name AS term
FROM ridings

UNION

SELECT
  ridings.id AS searchable_id,
  'MemberOfProvincialParliament' AS searchable_type,
  member_of_provincial_parliaments.full_name AS term
FROM ridings
JOIN member_of_provincial_parliaments ON ridings.id = member_of_provincial_parliaments.riding_id