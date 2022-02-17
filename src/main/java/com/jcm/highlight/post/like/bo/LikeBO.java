package com.jcm.highlight.post.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jcm.highlight.post.like.dao.LikeDAO;

@Service
public class LikeBO {
	
	
	@Autowired
	private LikeDAO likeDAO;
	
	public boolean addLike(int postId, int userId) {
		
		//전달받은 데이터를 기반으로 좋아요 상채이면 좋아요 취소 - delete
		//좋아요 아닌 상채면 좋아요 -- insert
		
		if(this.isLike(postId, userId)) {
			likeDAO.deleteLike(postId, userId);
			return false;
		}else {//좋아요 아닌 상태 -> 좋아요
			likeDAO.insertLike(postId, userId);
			return true;
		}
		
	}
	
	
	
	public int getLikeCount(int postId) {
		
		return likeDAO.selectLikeCount(postId);
	}
	
	public boolean isLike(int postId, int userId) {
		return !(likeDAO.selectLikeCountByUserId(postId, userId) == 0);
	}

	public int deleteLikeByPostId(int postId) {
		return likeDAO.deleteLikeByPost(postId);
	}
}
