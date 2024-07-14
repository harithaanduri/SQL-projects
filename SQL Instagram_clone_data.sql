
/*Create an ER diagram or draw a schema for the given database.*/

Goto schema,select the schema which is ig_clone database
 then click on  database select reverse engineer there connect options
 we get set parameter to connect database popup will open click on apply
 there ask your permission(password) as root&parameters to connect then 
 select sheama popoup we get.there we can select on which sceama we want
 ER diagram,select the scheama ig_clone click on next and next we get retrive 
 and riverse engineer database popup will open ,select objects to reverse engineer,
 there are all tables in ig_clone,select what we want  click on execute,
 we get reverse engineer progree popup ,operation completed successfully 
 click on next then we get reverse engineer results like how many tables we have,
 how many views we have on ig_clone scheama click on finish then we get 
 ER diagram on ig_clone database.


/* 2.We want to reward the user who has been around the longest,
 Find the 5 oldest users.*/

select * from users
order by created_at
limit 5;


/*To target inactive users in an email ad campaign,
 find the users who have never posted a photo.*/


 select u.id,username from users u
 where u.id not in (select user_id from photos)
 order by u.id;


/* 4.Suppose you are running a contest
 to find out who got the most likes on a photo. Find out who won?*/

with total_likes as
(select count(user_id) tot_likes,photo_id from likes
group by photo_id
order by count(user_id) desc
limit 1)
select username,tot_likes,tl.photo_id,image_url from total_likes tl
join photos p on tl.photo_id=p.id
join users u on p.user_id=u.id;

/* 5.The investors want to know how many times
 does the average user post.*/


SELECT ROUND((SELECT COUNT(*)FROM photos)/(SELECT COUNT(*) FROM users),2)as avg_times_posting;

/* 6.A brand wants to know which hashtag to use on a post, 
and find the top 5 most used hashtags.*/

select count(photo_id),tag_id,tag_name from photo_tags pt
join tags t on pt.tag_id=t.id
group by tag_id,tag_name
order by tag_id desc
limit 5;

/* 7.To find out if there are bots, 
find users who have liked every single photo on the site.*/

select count(photo_id) as likes_photos,user_id,username from likes l
join users u on l.user_id=u.id
group by user_id,username
order by count(photo_id) desc
limit 13;



/* 8.Find the users who have created instagramid in may 
and select top 5 newest joinees from it?*/


select username,created_at,monthname(created_at) from users
where monthname(created_at)='may'
order by created_at desc
limit 5;



/* 9.Can you help me find the users 
whose name starts with c and ends with any number 
and have posted the photos as well as liked the photos?*/


with user_like_photo as
(select distinct user_id,photo_id from likes)
select ulp.user_id,u.username,p.id as photo_id from user_like_photo ulp
join photos p on ulp.user_id=p.user_id
join users u on p.user_id=u.id
and u.username regexp '^c.*[0-9]';


/* 10.Demonstrate the top 30 usernames to the company
 who have posted photos in the range of 3 to 5.*/


select user_id,username,count(image_url) from users u
 join photos p on u.id=p.user_id
 group by u.id,username
 having count(image_url) between 3 and 5
 order by count(image_url) desc
 limit 30;
 



