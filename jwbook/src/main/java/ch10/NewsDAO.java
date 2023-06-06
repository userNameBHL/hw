package ch10;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NewsDAO {
	final String JDBC_DRIVER = "org.h2.Driver";
	final String JDBC_URL = "jdbc:h2:tcp://localhost/~/jwbookdb";
	
	// DB 연결을 가져오는 메서드, DBCP를 사용하는 것이 좋음
	public Connection open() {
		Connection conn = null;
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(JDBC_URL,"jwbook","1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public List<News> getAll() throws Exception {
		Connection conn = open();
		List<News> newsList = new ArrayList<>();
		
		String sql = "select aid, name, PARSEDATETIME(date,'yyyy-MM-dd hh:mm:ss') as cdate,title,email from news";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		try(conn; pstmt; rs) {
			while(rs.next()) {
				News n = new News();
				n.setAid(rs.getInt("aid"));
				n.setName(rs.getString("name"));
				n.setDate(rs.getString("cdate")); 
				n.setTitle(rs.getString("title")); 
				n.setEmail(rs.getString("email"));
				newsList.add(n);
			}
			return newsList;			
		}
	}
	
	public News getNews(int aid) throws SQLException {
		Connection conn = open();
		
		News n = new News();
		String sql = "select aid, name, PARSEDATETIME(date,'yyyy-MM-dd hh:mm:ss') as cdate, title,email from news where aid=?";
	
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, aid);
		ResultSet rs = pstmt.executeQuery();
		
		rs.next();
		
		try(conn; pstmt; rs) {
			n.setAid(rs.getInt("aid"));
			n.setName(rs.getString("name"));
			n.setDate(rs.getString("cdate"));
			n.setTitle(rs.getString("title"));
			n.setEmail(rs.getString("email"));
			pstmt.executeQuery();
			return n;
		}
	}
	
	public void addNews(News n) throws Exception {
		Connection conn = open();
		
		String sql = "insert into news(name,date,title,email) values(?,CURRENT_TIMESTAMP(),?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		try(conn; pstmt) {
			pstmt.setString(1, n.getName());
			pstmt.setString(2, n.getTitle());
			pstmt.setString(3, n.getEmail());
			pstmt.executeUpdate();
		}
	}
	
	public void delNews(int aid) throws SQLException {
		Connection conn = open();
		
		String sql = "delete from news where aid=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		try(conn; pstmt) {
			pstmt.setInt(1, aid);
			// 삭제된 뉴스 기사가 없을 경우
			if(pstmt.executeUpdate() == 0) {
				throw new SQLException("DB에러");
			}
		}
	}
	
	public void deleteAllNews() throws SQLException {
	    Connection conn = open();
	    
	    String sql = "DELETE FROM news";
	    PreparedStatement pstmt = conn.prepareStatement(sql);
	    
	    try (conn; pstmt) {
	        pstmt.executeUpdate();
	    }
	}
}
