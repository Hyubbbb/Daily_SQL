-- https://platform.stratascratch.com/coding/9805-find-drafts-which-contains-the-word-optimism
SELECT *
FROM google_file_store
WHERE 1=1
    AND filename LIKE 'draft%'
    AND contents LIKE '%optimism%'
