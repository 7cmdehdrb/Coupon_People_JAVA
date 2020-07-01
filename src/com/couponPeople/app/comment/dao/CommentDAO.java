package com.couponPeople.app.comment.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.couponPeople.mybatis.config.SqlMapConfig;

public class CommentDAO {
	
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public CommentDAO() {
		// TODO Auto-generated constructor stub
		sqlsession = sessionf.openSession(true);
	}
	
	public boolean createComment(CommentBean comment) {
		int result = 0;
		
		try {
			result = sqlsession.insert("Comment.createComment", comment);
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println(e);
			System.out.println("ERROR ON CREATE COMMENT");
		}
		
		return result == 1;
	}
	
	public List<CommentBean> getComments(int coupon_num){
		
		List<Object> temp = null;
		List<CommentBean> result = new ArrayList<>();
		
		try {
			temp = sqlsession.selectList("Comment.getComments", coupon_num);
		
			for (Object element : temp) {
				result.add((CommentBean)element);
			}
		
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println(e);
			System.out.println("ERROR ON GET COMMENTS");
		}
		
		return result;
	}
	
	public boolean deleteComment(CommentBean comment) {
		int result = 0;
		
		try {
			result = sqlsession.update("Comment.deleteComment", comment);
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println(e);
			System.out.println("ERROR ON DELETE COMMENT");
		}
		
		return result == 1;
	}
	
	public List<CommentBean> getUserComments(String user_email){
		
		List<Object> temp = null;
		List<CommentBean> result = new ArrayList<>();
		
		try {
		
			temp = sqlsession.selectList("Comment.getUserComments", user_email);

			for (Object element : temp) {
				result.add((CommentBean)element);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println(e);
			System.out.println("ERROR ON GET USER COMMENTS");
		}
		
		return result;
	}

}
