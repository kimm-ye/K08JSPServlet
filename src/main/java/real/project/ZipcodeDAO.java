package real.project;

import java.util.ArrayList;

import common.DBConnPool;

public class ZipcodeDAO extends DBConnPool {
	
	
	public ArrayList<String> getSido(){
		ArrayList<String> sidoAddr = new ArrayList<String>();
		
		//여기서 where 1=1을 쓴 이유는 true임을 말한다. distinct는 중복제거한 거임
		String sql = " SELECT distinct sido FROM zipcode WHERE 1=1 ORDER BY sido ASC ";
		
		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				sidoAddr.add(rs.getString(1));
			}
		}
		catch (Exception e) {}
		
		return sidoAddr;
	}
	
	
	public ArrayList<String> getGugun(String sido){
		ArrayList<String> getGugunAddr = new ArrayList<String>();
		
		String sql = " SELECT distinct gugun FROM zipcode WHERE sido=? ORDER BY gugun DESC ";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, sido);
			rs = psmt.executeQuery();
			while(rs.next()) {
				getGugunAddr.add(rs.getString(1));
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return getGugunAddr;
	}
}
