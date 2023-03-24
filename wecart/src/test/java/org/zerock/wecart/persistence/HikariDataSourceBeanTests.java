package org.zerock.wecart.persistence;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Objects;
import java.util.concurrent.TimeUnit;

import javax.sql.DataSource;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestInstance.Lifecycle;
import org.junit.jupiter.api.TestMethodOrder;
import org.junit.jupiter.api.Timeout;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import lombok.Cleanup;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

//Spring Framework도 함께 구동
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations= "file:src/main/webapp/WEB-INF/**/root-context.xml")

@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class HikariDataSourceBeanTests {
	
	@Setter(onMethod_= {@Autowired})
	private DataSource dataSource;		// 의존성주입 대상필드
	
	
	
	@BeforeAll
	void beforeAll() {
		log.trace("beforeAll() invoked.");
		
		assertNotNull(this.dataSource);
		log.info("\t+ this.dataSource: {}", this.dataSource);
	} // beforeAll
	
	
//	@Disable
	@Test
	@Order(1)
	@DisplayName("Test1: To get a JDBC connection from the Data Source.")
	@Timeout(value=1, unit=TimeUnit.SECONDS)
	void testGetConnection() throws SQLException {
		log.trace("testGetConnection() invoked.");
		
		@Cleanup
		Connection conn = this.dataSource.getConnection();
		
		Objects.requireNonNull(conn);
		log.info("\t+ conn: {}", conn);
	} // testGetConnection
	
	//COMPRI 계정 테이블에 데이터가 들어왔을 때 테스트 로직 짜기
//	@Disable
	@Test
	@Order(2)
	@DisplayName("Test2: To test a SQL using the connection.")
	@Timeout(value=1, unit=TimeUnit.SECONDS)
	void testSQL() throws SQLException {
		log.trace("testSQL() invoked.");
				
		@Cleanup Connection conn = this.dataSource.getConnection();
		@Cleanup Statement stmt = conn.createStatement();
		@Cleanup ResultSet rs = stmt.executeQuery("SELECT * FROM employees");
		
		while(rs.next()) {
			String empId = rs.getString("EMPLOYEE_ID");
			String fName = rs.getString("FIRST_NAME");
			String lName = rs.getString("LAST_NAME");
			
			log.info("({}, {}, {})", empId, fName, lName);
		} // while		
	} // testSQL

} // end class
