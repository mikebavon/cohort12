<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>JSTL Core Library (c) - Logic, Loops & Variables</title>
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
            margin: 0;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            border-radius: 10px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.2);
        }
        header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 30px;
            text-align: center;
            border-radius: 10px 10px 0 0;
        }
        .content { padding: 30px; }
        .section { margin-bottom: 40px; border-left: 5px solid #667eea; padding-left: 20px; }
        .section h2 { color: #667eea; margin-bottom: 15px; }
        .subsection { background: #f8f9fa; padding: 15px; margin: 10px 0; border-radius: 5px; border-left: 3px solid #764ba2; }
        .code-block { background: #2c3e50; color: #ecf0f1; padding: 15px; border-radius: 5px; margin: 10px 0; font-family: monospace; overflow-x: auto; }
        .output { background: #e8f5e9; border-left: 4px solid #4caf50; padding: 12px; margin: 10px 0; border-radius: 3px; color: #2e7d32; }
        table { width: 100%; border-collapse: collapse; margin: 10px 0; }
        th, td { border: 1px solid #ddd; padding: 12px; text-align: left; }
        th { background-color: #667eea; color: white; }
        .badge { display: inline-block; background: #667eea; color: white; padding: 5px 10px; border-radius: 20px; font-size: 0.85em; margin: 3px; }
        .list-item { background: white; padding: 10px; margin: 5px 0; border-left: 4px solid #667eea; }
        footer { background: #f8f9fa; padding: 20px; text-align: center; color: #666; border-top: 1px solid #ddd; }
    </style>
</head>

<body>
    <div class="container">
        <header>
            <h1>🏷️ JSTL Core Library Demonstration</h1>
            <p>Logic, Loops, Variables & Conditionals (prefix: c)</p>
        </header>
        
        <div class="content">
            
            <!-- SET TAG - STORING VARIABLES -->
            <div class="section">
                <h2>1. Variable Management with &lt;c:set&gt;</h2>
                <p>Store and manage variables in different scopes</p>
                
                <!-- Set variables -->
                <c:set var="applicationName" value="COHORT 12 JSP Application" scope="page"/>
                <c:set var="currentYear" value="2026" scope="page"/>
                <c:set var="studentCount" value="45" scope="page"/>
                
                <div class="subsection">
                    <h3>Setting Variables</h3>
                    <div class="code-block">
&lt;c:set var="applicationName" value="COHORT 12 JSP Application" scope="page"/&gt;
&lt;c:set var="studentCount" value="45" scope="page"/&gt;
                    </div>
                    <div class="output">
                        <strong>Application:</strong> ${applicationName}<br>
                        <strong>Year:</strong> ${currentYear}<br>
                        <strong>Students:</strong> ${studentCount}
                    </div>
                </div>
                
                <div class="subsection">
                    <h3>Variables from Expressions</h3>
                    <c:set var="totalFee" value="${studentCount * 50000}" scope="page"/>
                    <div class="code-block">
&lt;c:set var="totalFee" value="${studentCount * 50000}" scope="page"/&gt;
                    </div>
                    <div class="output">
                        <strong>Total Fee (45 students x 50,000):</strong> ${totalFee}
                    </div>
                </div>
            </div>
            
            <!-- OUT TAG - DISPLAYING CONTENT -->
            <div class="section">
                <h2>2. Output Content with &lt;c:out&gt;</h2>
                <p>Display and escape content safely</p>
                
                <div class="subsection">
                    <h3>Basic Output with Escaping</h3>
                    <c:set var="userInput" value="&lt;script&gt;alert('XSS')&lt;/script&gt;" scope="page"/>
                    <div class="code-block">
&lt;c:out value="${userInput}" escapeXml="true"/&gt;
                    </div>
                    <div class="output">
                        <strong>Safe Output (escaped):</strong> <c:out value="${userInput}" escapeXml="true"/><br>
                        <strong>Unsafe Output (not escaped):</strong> <c:out value="${userInput}" escapeXml="false"/>
                    </div>
                </div>
                
                <div class="subsection">
                    <h3>Default Value</h3>
                    <div class="code-block">
&lt;c:out value="${nonExistent}" default="No value found"/&gt;
                    </div>
                    <div class="output">
                        <strong>Non-existent variable:</strong> <c:out value="${nonExistent}" default="No value found"/>
                    </div>
                </div>
            </div>
            
            <!-- IF/ELSE TAGS - CONDITIONALS -->
            <div class="section">
                <h2>3. Conditional Logic with &lt;c:if&gt; & &lt;c:choose&gt;</h2>
                <p>Execute code based on conditions</p>
                
                <div class="subsection">
                    <h3>Simple If Statement</h3>
                    <div class="code-block">
&lt;c:if test="${studentCount > 40}"&gt;
  &lt;p&gt;We have many students!&lt;/p&gt;
&lt;/c:if&gt;
                    </div>
                    <div class="output">
                        <c:if test="${studentCount > 40}">
                            ✅ We have many students (${studentCount})!
                        </c:if>
                    </div>
                </div>
                
                <div class="subsection">
                    <h3>If-Else using &lt;c:choose&gt;, &lt;c:when&gt;, &lt;c:otherwise&gt;</h3>
                    <c:set var="score" value="78" scope="page"/>
                    <div class="code-block">
&lt;c:choose&gt;
  &lt;c:when test="${score >= 90}"&gt;Grade: A&lt;/c:when&gt;
  &lt;c:when test="${score >= 80}"&gt;Grade: B&lt;/c:when&gt;
  &lt;c:when test="${score >= 70}"&gt;Grade: C&lt;/c:when&gt;
  &lt;c:otherwise&gt;Grade: F&lt;/c:otherwise&gt;
&lt;/c:choose&gt;
                    </div>
                    <div class="output">
                        <c:choose>
                            <c:when test="${score >= 90}">🏅 Grade: A (Outstanding)</c:when>
                            <c:when test="${score >= 80}">🥈 Grade: B (Very Good)</c:when>
                            <c:when test="${score >= 70}">🥉 Grade: C (Good) - Score: ${score}</c:when>
                            <c:otherwise>❌ Grade: F (Fail)</c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
            
            <!-- FOREACH LOOP -->
            <div class="section">
                <h2>4. Loops with &lt;c:forEach&gt;</h2>
                <p>Iterate over collections and arrays</p>
                
                <div class="subsection">
                    <h3>Simple Loop (Counting 1-5)</h3>
                    <div class="code-block">
&lt;c:forEach begin="1" end="5" var="i"&gt;
  &lt;span&gt;${i}&lt;/span&gt;
&lt;/c:forEach&gt;
                    </div>
                    <div class="output">
                        <strong>Counting:</strong><br>
                        <c:forEach begin="1" end="5" var="i">
                            <span class="badge">Count: ${i}</span>
                        </c:forEach>
                    </div>
                </div>
                
                <div class="subsection">
                    <h3>Loop with Step (0 to 20, step 5)</h3>
                    <div class="code-block">
&lt;c:forEach begin="0" end="20" step="5" var="i"&gt;
  &lt;span&gt;${i}&lt;/span&gt;
&lt;/c:forEach&gt;
                    </div>
                    <div class="output">
                        <strong>Every 5th number:</strong><br>
                        <c:forEach begin="0" end="20" step="5" var="i">
                            <span class="badge">Value: ${i}</span>
                        </c:forEach>
                    </div>
                </div>
                
                <div class="subsection">
                    <h3>Loop Over Array</h3>
                    <%
                        String[] technologies = {"Java", "JSP", "Servlets", "JSTL", "EJB"};
                        request.setAttribute("technologies", technologies);
                    %>
                    <div class="code-block">
&lt;% String[] technologies = {"Java", "JSP", "Servlets", "JSTL", "EJB"}; %&gt;
&lt;c:forEach items="${technologies}" var="tech"&gt;
  &lt;p&gt;${tech}&lt;/p&gt;
&lt;/c:forEach&gt;
                    </div>
                    <div class="output">
                        <strong>Technologies:</strong><br>
                        <c:forEach items="${technologies}" var="tech">
                            <div class="list-item">▶️ ${tech}</div>
                        </c:forEach>
                    </div>
                </div>
                
                <div class="subsection">
                    <h3>Loop with Status Variables</h3>
                    <div class="code-block">
&lt;c:forEach items="${technologies}" var="tech" varStatus="status"&gt;
  Index: ${status.index}, Count: ${status.count}, First: ${status.first}, Last: ${status.last}
&lt;/c:forEach&gt;
                    </div>
                    <div class="output">
                        <table>
                            <tr>
                                <th>Index</th>
                                <th>Count</th>
                                <th>Technology</th>
                                <th>First?</th>
                                <th>Last?</th>
                            </tr>
                            <c:forEach items="${technologies}" var="tech" varStatus="status">
                                <tr>
                                    <td>${status.index}</td>
                                    <td>${status.count}</td>
                                    <td>${tech}</td>
                                    <td><c:if test="${status.first}">✓</c:if></td>
                                    <td><c:if test="${status.last}">✓</c:if></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
                
                <div class="subsection">
                    <h3>Loop Over List</h3>
                    <%
                        List<String> courses = new ArrayList<>();
                        courses.add("Core Java");
                        courses.add("Advanced Java");
                        courses.add("Web Development");
                        request.setAttribute("courses", courses);
                    %>
                    <div class="code-block">
&lt;% List&lt;String&gt; courses = new ArrayList&lt;&gt;();
courses.add("Core Java");
courses.add("Advanced Java");
request.setAttribute("courses", courses); %&gt;
&lt;c:forEach items="${courses}" var="course"&gt;
  &lt;p&gt;${course}&lt;/p&gt;
&lt;/c:forEach&gt;
                    </div>
                    <div class="output">
                        <strong>Available Courses:</strong><br>
                        <c:forEach items="${courses}" var="course">
                            <div class="list-item">📚 ${course}</div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            
            <!-- FORTOKEN LOOP -->
            <div class="section">
                <h2>5. String Tokenization with &lt;c:forTokens&gt;</h2>
                <p>Iterate over delimited strings (split strings)</p>
                
                <c:set var="studentNames" value="John,Jane,Bob,Alice,Charlie" scope="page"/>
                
                <div class="subsection">
                    <h3>Split String and Loop (Comma-Separated)</h3>
                    <div class="code-block">
&lt;c:set var="studentNames" value="John,Jane,Bob,Alice,Charlie"/&gt;
&lt;c:forTokens items="${studentNames}" delimiters="," var="name"&gt;
  &lt;p&gt;${name}&lt;/p&gt;
&lt;/c:forTokens&gt;
                    </div>
                    <div class="output">
                        <strong>Student Names (from comma-separated string):</strong><br>
                        <c:forTokens items="${studentNames}" delimiters="," var="name">
                            <div class="list-item">👤 ${name}</div>
                        </c:forTokens>
                    </div>
                </div>
                
                <div class="subsection">
                    <h3>Multiple Delimiters</h3>
                    <c:set var="data" value="apple|banana;orange,mango" scope="page"/>
                    <div class="code-block">
&lt;c:set var="data" value="apple|banana;orange,mango"/&gt;
&lt;c:forTokens items="${data}" delimiters="|;," var="item"&gt;
  &lt;span&gt;${item}&lt;/span&gt;
&lt;/c:forTokens&gt;
                    </div>
                    <div class="output">
                        <strong>Fruits (split by |, ;, and comma):</strong><br>
                        <c:forTokens items="${data}" delimiters="|;," var="item">
                            <span class="badge">🍎 ${item}</span>
                        </c:forTokens>
                    </div>
                </div>
            </div>
            
            <!-- URL AND PARAM TAGS -->
            <div class="section">
                <h2>6. URL Building with &lt;c:url&gt; & &lt;c:param&gt;</h2>
                <p>Construct URLs with parameters safely</p>
                
                <div class="subsection">
                    <h3>Creating URLs with Parameters</h3>
                    <c:url value="/cohort12/jsp-demo-features.jsp" var="demoUrl">
                        <c:param name="userId" value="123"/>
                        <c:param name="action" value="view"/>
                    </c:url>
                    <div class="code-block">
&lt;c:url value="/cohort12/jsp-demo-features.jsp" var="demoUrl"&gt;
  &lt;c:param name="userId" value="123"/&gt;
  &lt;c:param name="action" value="view"/&gt;
&lt;/c:url&gt;
Generated URL: &lt;c:out value="${demoUrl}"/&gt;
                    </div>
                    <div class="output">
                        <strong>Generated URL:</strong> <code><c:out value="${demoUrl}"/></code><br><br>
                        <a href="${demoUrl}" style="color: #667eea; font-weight: bold;">👉 Open JSP Demo Features Page</a>
                    </div>
                </div>
            </div>
            
            <!-- CATCH TAG -->
            <div class="section">
                <h2>7. Exception Handling with &lt;c:catch&gt;</h2>
                <p>Catch and handle exceptions gracefully</p>
                
                <div class="subsection">
                    <h3>Catching and Handling Errors</h3>
                    <div class="code-block">
&lt;c:catch var="error"&gt;
  &lt;% int result = 10 / 0; %&gt; &lt;!-- Will throw exception --&gt;
&lt;/c:catch&gt;
&lt;c:if test="${error != null}"&gt;
  &lt;p&gt;Error caught: ${error}&lt;/p&gt;
&lt;/c:if&gt;
                    </div>
                    <div class="output">
                        <c:catch var="arithmeticError">
                            <%
                                try {
                                    int x = 10;
                                    int y = 0;
                                    int result = x / y;
                                } catch (ArithmeticException e) {
                                    throw e;
                                }
                            %>
                        </c:catch>
                        <c:if test="${arithmeticError != null}">
                            ✅ Error caught and handled safely!<br>
                            <strong>Error:</strong> <c:out value="${arithmeticError}"/>
                        </c:if>
                    </div>
                </div>
            </div>
            
            <!-- PRACTICAL EXAMPLE -->
            <div class="section">
                <h2>🎯 Practical Example: Student Report Card</h2>
                <p>Using multiple JSTL Core features together</p>
                
                <%
                    List<String> studentList = new ArrayList<>();
                    studentList.add("John");
                    studentList.add("Jane");
                    studentList.add("Bob");
                    studentList.add("Alice");
                    request.setAttribute("studentList", studentList);
                %>
                
                <div class="output">
                    <h3>📋 Student Attendance Report</h3>
                    <c:set var="totalStudents" value="${studentList.size()}"/>
                    <p><strong>Total Students: </strong>${totalStudents}</p>
                    
                    <table>
                        <tr>
                            <th>#</th>
                            <th>Student Name</th>
                            <th>Status</th>
                            <th>Remarks</th>
                        </tr>
                        <c:forEach items="${studentList}" var="student" varStatus="loop">
                            <c:set var="isPresent" value="${loop.index % 2 == 0}"/>
                            <tr>
                                <td>${loop.count}</td>
                                <td><strong>${student}</strong></td>
                                <td>
                                    <c:if test="${isPresent}">
                                        <span class="badge" style="background: #4caf50;">Present</span>
                                    </c:if>
                                    <c:if test="${!isPresent}">
                                        <span class="badge" style="background: #f44336;">Absent</span>
                                    </c:if>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${loop.first}">First Student</c:when>
                                        <c:when test="${loop.last}">Last Student</c:when>
                                        <c:otherwise>Mid Student</c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
            
        </div>
        
        <footer>
            <p><strong>JSTL Core Library (c) Demonstration</strong> | COHORT 12 Training Portal</p>
            <p>Core Tags: c:set | c:out | c:if | c:choose | c:forEach | c:forTokens | c:url | c:catch | c:param</p>
            <hr style="border: none; border-top: 1px solid #ddd; margin: 10px 0;">
            <p style="font-size: 0.9em;">
                <strong>Key Concepts:</strong>
                Scopes (page, request, session, application) | Variables | Conditionals | Loops | String Tokenization | URL Encoding | Exception Handling
            </p>
        </footer>
    </div>
</body>

</html>
