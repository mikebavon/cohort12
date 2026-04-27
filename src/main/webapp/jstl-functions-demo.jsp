<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>JSTL Functions Library (fn) - String Functions</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
            min-height: 100vh;
            padding: 20px;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            border-radius: 10px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.2);
        }
        header {
            background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
            color: white;
            padding: 30px;
            text-align: center;
            border-radius: 10px 10px 0 0;
        }
        header h1 { font-size: 2.2em; margin-bottom: 10px; }
        header p { font-size: 1.1em; opacity: 0.9; }
        .content { padding: 30px; }
        .section {
            margin-bottom: 40px;
            border-left: 5px solid #11998e;
            padding-left: 20px;
        }
        .section h2 {
            color: #11998e;
            margin-bottom: 15px;
            font-size: 1.6em;
            border-bottom: 2px solid #11998e;
            padding-bottom: 8px;
        }
        .subsection {
            background: #f8f9fa;
            padding: 15px;
            margin: 12px 0;
            border-radius: 5px;
            border-left: 3px solid #38ef7d;
        }
        .subsection h3 { color: #11998e; margin-bottom: 10px; }
        .code-block {
            background: #2d3436;
            color: #dfe6e9;
            padding: 15px;
            border-radius: 5px;
            margin: 10px 0;
            font-family: 'Courier New', monospace;
            overflow-x: auto;
            font-size: 0.9em;
        }
        .output {
            background: #e8f5e9;
            border-left: 4px solid #27ae60;
            padding: 12px;
            margin: 10px 0;
            border-radius: 3px;
            color: #1e5f2f;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 10px 0;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        th { background: #11998e; color: white; }
        tr:nth-child(even) { background: #f8f9fa; }
        .badge {
            display: inline-block;
            background: #11998e;
            color: white;
            padding: 4px 10px;
            border-radius: 15px;
            font-size: 0.8em;
            margin-right: 5px;
        }
        .highlight {
            background: #fff3cd;
            padding: 2px 5px;
            border-radius: 3px;
        }
        hr { border: none; border-top: 2px solid #eee; margin: 25px 0; }
        footer {
            background: #f8f9fa;
            padding: 20px;
            text-align: center;
            color: #666;
            border-top: 1px solid #ddd;
        }
    </style>
</head>

<body>
    <div class="container">
        <header>
            <h1>🔤 JSTL Functions Library Demonstration</h1>
            <p>Prefix: <code>fn</code> - String Manipulation Functions</p>
        </header>
        
        <div class="content">
            
            <!-- ===== 1. LENGTH ===== -->
            <div class="section">
                <h2>1️⃣ Length Functions (fn:length)</h2>
                <p>Returns the number of items in a collection or the number of characters in a string</p>
                
                <div class="subsection">
                    <h3>1.1 Get Length of String</h3>
                    <div class="code-block">
&lt;%-- Syntax --%&gt;<br>
${fn:length(string)}<br>
<br>
&lt;%-- Example --%&gt;<br>
&lt;c:set var="text" value="Hello World"/&gt;<br>
${fn:length(text)}  &lt;%-- Returns 11 --%&gt;
                    </div>
                    
                    <c:set var="text" value="Hello World"/>
                    <c:set var="emptyText" value=""/>
                    <c:set var="longText" value="JSTL Functions are powerful string manipulation tools"/>
                    
                    <div class="output">
                        <strong>String Lengths:</strong><br>
                        "Hello World" length: <span class="highlight">${fn:length(text)}</span><br>
                        "" (empty) length: <span class="highlight">${fn:length(emptyText)}</span><br>
                        Long text length: <span class="highlight">${fn:length(longText)}</span>
                    </div>
                </div>
                
                <div class="subsection">
                    <h3>1.2 Get Length of Collection/Array</h3>
                    <%
                        List<String> fruits = Arrays.asList("Apple", "Banana", "Orange");
                        pageContext.setAttribute("fruitList", fruits);
                        
                        String[] colors = {"Red", "Blue", "Green", "Yellow"};
                        pageContext.setAttribute("colorArray", colors);
                    %>
                    
                    <div class="output">
                        <strong>Collection Lengths:</strong><br>
                        Fruit List (3 items): <span class="highlight">${fn:length(fruitList)}</span><br>
                        Color Array (4 items): <span class="highlight">${fn:length(colorArray)}</span>
                    </div>
                </div>
            </div>
            
            <hr>
            
            <!-- ===== 2. STRING FUNCTIONS ===== -->
            <div class="section">
                <h2>2️⃣ String Manipulation Functions</h2>
                
                <div class="subsection">
                    <h3>2.1 fn:toUpperCase & fn:toLowerCase</h3>
                    <div class="code-block">
${fn:toUpperCase(string)}  &lt;%-- Convert to uppercase --%&gt;<br>
${fn:toLowerCase(string)}  &lt;%-- Convert to lowercase --%&gt;
                    </div>
                    
                    <c:set var="mixedCase" value="HeLLo WoRLD"/>
                    
                    <div class="output">
                        Original: <strong><c:out value="${mixedCase}"/></strong><br>
                        toUpperCase: <span class="highlight">${fn:toUpperCase(mixedCase)}</span><br>
                        toLowerCase: <span class="highlight">${fn:toLowerCase(mixedCase)}</span>
                    </div>
                </div>
                
                <div class="subsection">
                    <h3>2.2 fn:trim</h3>
                    <div class="code-block">
${fn:trim(string)}  &lt;%-- Remove leading and trailing whitespace --%&gt;
                    </div>
                    
                    <c:set var="withSpaces" value="   Hello World   "/>
                    <c:set var="trimmed" value="${fn:trim(withSpaces)}"/>
                    
                    <div class="output">
                        Original (with spaces): "<c:out value="${withSpaces}"/>"<br>
                        After trim: "<span class="highlight"><c:out value="${trimmed}"/></span>"<br>
                        Length before: ${fn:length(withSpaces)} | After: ${fn:length(trimmed)}
                    </div>
                </div>
                
                <div class="subsection">
                    <h3>2.3 fn:substring</h3>
                    <div class="code-block">
${fn:substring(string, start, end)}  &lt;%-- Extract substring --%&gt;
                    </div>
                    
                    <c:set var="fullText" value="Hello World from JSTL"/>
                    
                    <div class="output">
                        Original: "<c:out value="${fullText}"/>"<br>
                        substring(0, 5): <span class="highlight">${fn:substring(fullText, 0, 5)}</span><br>
                        substring(6, 11): <span class="highlight">${fn:substring(fullText, 6, 11)}</span><br>
                        substring(12, 16): <span class="highlight">${fn:substring(fullText, 12, 16)}</span>
                    </div>
                </div>
                
                <div class="subsection">
                    <h3>2.4 fn:substringBefore & fn:substringAfter</h3>
                    <div class="code-block">
${fn:substringBefore(string, delimiter)}  &lt;%-- Before first occurrence --%&gt;<br>
${fn:substringAfter(string, delimiter)}  &lt;%-- After first occurrence --%&gt;
                    </div>
                    
                    <c:set var="email" value="user@example.com"/>
                    
                    <div class="output">
                        Email: "<c:out value="${email}"/>"<br>
                        substringBefore("@"): <span class="highlight">${fn:substringBefore(email, "@")}</span><br>
                        substringAfter("@"): <span class="highlight">${fn:substringAfter(email, "@")}</span>
                    </div>
                </div>
                
                <div class="subsection">
                    <h3>2.5 fn:replace</h3>
                    <div class="code-block">
${fn:replace(string, oldSubstring, newSubstring)}  &lt;%-- Replace all occurrences --%&gt;
                    </div>
                    
                    <c:set var="oldText" value="Hello World"/>
                    
                    <div class="output">
                        Original: "<c:out value="${oldText}"/>"<br>
                        Replace "World" with "JSTL": <span class="highlight">${fn:replace(oldText, "World", "JSTL")}</span><br>
                        Replace "o" with "0": <span class="highlight">${fn:replace(oldText, "o", "0")}</span>
                    </div>
                </div>
            </div>
            
            <hr>
            
            <!-- ===== 3. CONTAINS & STARTS/ENDS ===== -->
            <div class="section">
                <h2>3️⃣ Search Functions (contains, startsWith, endsWith)</h2>
                
                <div class="subsection">
                    <h3>3.1 fn:contains</h3>
                    <div class="code-block">
${fn:contains(string, substring)}  &lt;%-- Check if string contains substring --%&gt;
                    </div>
                    
                    <c:set var="mainString" value="The quick brown fox jumps over the lazy dog"/>
                    <c:set var="search1" value="fox"/>
                    <c:set var="search2" value="cat"/>
                    
                    <div class="output">
                        Main: "<c:out value="${mainString}"/>"<br>
                        Contains "fox": <span class="highlight">${fn:contains(mainString, search1)}</span><br>
                        Contains "cat": <span class="highlight">${fn:contains(mainString, search2)}</span>
                    </div>
                </div>
                
                <div class="subsection">
                    <h3>3.2 fn:containsIgnoreCase</h3>
                    <div class="code-block">
${fn:containsIgnoreCase(string, substring)}  &lt;%-- Case-insensitive search --%&gt;
                    </div>
                    
                    <c:set var="caseText" value="Hello World"/>
                    
                    <div class="output">
                        Original: "<c:out value="${caseText}"/>"<br>
                        contains("hello"): <span class="highlight">${fn:contains(caseText, "hello")}</span><br>
                        containsIgnoreCase("hello"): <span class="highlight">${fn:containsIgnoreCase(caseText, "hello")}</span>
                    </div>
                </div>
                
                <div class="subsection">
                    <h3>3.3 fn:startsWith & fn:endsWith</h3>
                    <div class="code-block">
${fn:startsWith(string, prefix)}  &lt;%-- Check if starts with prefix --%&gt;<br>
${fn:endsWith(string, suffix)}    &lt;%-- Check if ends with suffix --%&gt;
                    </div>
                    
                    <c:set var="fileName" value="document.pdf"/>
                    
                    <div class="output">
                        File: "<c:out value="${fileName}"/>"<br>
                        startsWith("doc"): <span class="highlight">${fn:startsWith(fileName, "doc")}</span><br>
                        endsWith(".pdf"): <span class="highlight">${fn:endsWith(fileName, ".pdf")}</span><br>
                        endsWith(".doc"): <span class="highlight">${fn:endsWith(fileName, ".doc")}</span>
                    </div>
                </div>
                
                <div class="subsection">
                    <h3>3.4 fn:indexOf</h3>
                    <div class="code-block">
${fn:indexOf(string, substring)}  &lt;%-- Returns position of first occurrence --%&gt;
                    </div>
                    
                    <c:set var="searchText" value="Hello World World"/>
                    
                    <div class="output">
                        Text: "<c:out value="${searchText}"/>"<br>
                        indexOf("World"): <span class="highlight">${fn:indexOf(searchText, "World")}</span><br>
                        indexOf("Hello"): <span class="highlight">${fn:indexOf(searchText, "Hello")}</span><br>
                        indexOf("xyz"): <span class="highlight">${fn:indexOf(searchText, "xyz")}</span> (returns -1 if not found)
                    </div>
                </div>
            </div>
            
            <hr>
            
            <!-- ===== 4. JOIN & SPLIT ===== -->
            <div class="section">
                <h2>4️⃣ Array Functions (fn:join, fn:split)</h2>
                
                <div class="subsection">
                    <h3>4.1 fn:join - Join Array Elements</h3>
                    <div class="code-block">
${fn:join(array, delimiter)}  &lt;%-- Join array elements with delimiter --%&gt;
                    </div>
                    
                    <%
                        String[] animals = {"Dog", "Cat", "Bird", "Fish"};
                        pageContext.setAttribute("animalArray", animals);
                    %>
                    
                    <div class="output">
                        Array: [Dog, Cat, Bird, Fish]<br>
                        join with ", ": <span class="highlight">${fn:join(animalArray, ", ")}</span><br>
                        join with " - ": <span class="highlight">${fn:join(animalArray, " - ")}</span>
                    </div>
                </div>
                
                <div class="subsection">
                    <h3>4.2 fn:split - Split String into Array</h3>
                    <div class="code-block">
${fn:split(string, delimiter)}  &lt;%-- Split string into array --%&gt;
                    </div>
                    
                    <c:set var="csvString" value="apple,banana,orange,grape"/>
                    
                    <div class="output">
                        CSV: "<c:out value="${csvString}"/>"<br>
                        Split by ",": <span class="highlight">${fn:split(csvString, ",")}</span><br>
                        Length after split: <span class="highlight">${fn:length(fn:split(csvString, ","))}</span>
                    </div>
                </div>
                
                <div class="subsection">
                    <h3>4.3 Combined: Split + Join</h3>
                    <c:set var="data" value="one,two,three,four,five"/>
                    
                    <div class="output">
                        Original: "<c:out value="${data}"/>"<br>
                        Split by "," then join by " | ": <span class="highlight">${fn:join(fn:split(data, ","), " | ")}</span>
                    </div>
                </div>
            </div>
            
            <hr>
            
            <!-- ===== 5. ESCAPE FUNCTIONS ===== -->
            <div class="section">
                <h2>5️⃣ Escape Functions (fn:escapeXml)</h2>
                
                <div class="subsection">
                    <h3>5.1 fn:escapeXml</h3>
                    <div class="code-block">
${fn:escapeXml(string)}  &lt;%-- Escape XML special characters --%&gt;
                    </div>
                    
                    <c:set var="htmlString" value="<script>alert('XSS')</script>"/>
                    <c:set var="specialChars" value="<>&'&quot;"/>
                    
                    <div class="output">
                        HTML String: "<c:out value="${htmlString}"/>"<br>
                        escapeXml: <span class="highlight">${fn:escapeXml(htmlString)}</span><br>
                        <br>
                        Special chars: "<c:out value="${specialChars}"/>"<br>
                        escapeXml: <span class="highlight">${fn:escapeXml(specialChars)}</span>
                    </div>
                </div>
            </div>
            
            <hr>
            
            <!-- ===== 6. PRACTICAL EXAMPLES ===== -->
            <div class="section">
                <h2>6️⃣ Practical Examples</h2>
                
                <div class="subsection">
                    <h3>6.1 Email Validation</h3>
                    <c:set var="userEmail" value="user@example.com"/>
                    
                    <div class="output">
                        Email: "<c:out value="${userEmail}"/>"<br>
                        Contains @: <span class="highlight">${fn:contains(userEmail, "@")}</span><br>
                        Contains .: <span class="highlight">${fn:contains(userEmail, ".")}</span><br>
                        Not empty: <span class="highlight">${fn:length(userEmail) > 0}</span>
                    </div>
                </div>
                
                <div class="subsection">
                    <h3>6.2 File Extension Check</h3>
                    <c:set var="file1" value="image.png"/>
                    <c:set var="file2" value="document.pdf"/>
                    <c:set var="file3" value="readme.txt"/>
                    
                    <div class="output">
                        <c:set var="ext1" value="${fn:substringAfter(file1, '.')}"/>
                        <c:set var="ext2" value="${fn:substringAfter(file2, '.')}"/>
                        <c:set var="ext3" value="${fn:substringAfter(file3, '.')}"/>
                        
                        <strong>File Extensions:</strong><br>
                        image.png → .<c:out value="${ext1}"/> (is png? ${ext1 == 'png'})<br>
                        document.pdf → .<c:out value="${ext2}"/> (is pdf? ${ext2 == 'pdf'})<br>
                        readme.txt → .<c:out value="${ext3}"/> (is txt? ${ext3 == 'txt'})
                    </div>
                </div>
                
                <div class="subsection">
                    <h3>6.3 Truncate Long Text</h3>
                    <c:set var="longDescription" value="This is a very long description that needs to be truncated to a shorter version for display purposes."/>
                    
                    <div class="output">
                        <strong>Original:</strong> <c:out value="${longDescription}"/><br>
                        <br>
                        <strong>Truncated (50 chars):</strong> 
                        <c:set var="truncated" value="${fn:substring(longDescription, 0, 50)}"/>
                        <c:out value="${truncated}"/>...
                    </div>
                </div>
                
                <div class="subsection">
                    <h3>6.4 Name Formatting</h3>
                    <c:set var="fullName" value="  john doe  "/>
                    
                    <div class="output">
                        Original: "<c:out value="${fullName}"/>"<br>
                        Trim + Title Case: <span class="highlight">${fn:toUpperCase(fn:trim(fullName))}</span>
                    </div>
                </div>
            </div>
            
            <hr>
            
            <!-- ===== SUMMARY TABLE ===== -->
            <div class="section">
                <h2>📋 JSTL Functions Summary</h2>
                
                <table>
                    <tr>
                        <th>Function</th>
                        <th>Description</th>
                        <th>Example</th>
                    </tr>
                    <tr>
                        <td><code>fn:length()</code></td>
                        <td>Returns length of string or collection</td>
                        <td><code>${fn:length(str)}</code></td>
                    </tr>
                    <tr>
                        <td><code>fn:toUpperCase()</code></td>
                        <td>Converts string to uppercase</td>
                        <td><code>${fn:toUpperCase(str)}</code></td>
                    </tr>
                    <tr>
                        <td><code>fn:toLowerCase()</code></td>
                        <td>Converts string to lowercase</td>
                        <td><code>${fn:toLowerCase(str)}</code></td>
                    </tr>
                    <tr>
                        <td><code>fn:trim()</code></td>
                        <td>Removes whitespace from both ends</td>
                        <td><code>${fn:trim(str)}</code></td>
                    </tr>
                    <tr>
                        <td><code>fn:substring()</code></td>
                        <td>Extracts substring by indices</td>
                        <td><code>${fn:substring(str, 0, 5)}</code></td>
                    </tr>
                    <tr>
                        <td><code>fn:substringBefore()</code></td>
                        <td>Returns substring before delimiter</td>
                        <td><code>${fn:substringBefore(str, "@")}</code></td>
                    </tr>
                    <tr>
                        <td><code>fn:substringAfter()</code></td>
                        <td>Returns substring after delimiter</td>
                        <td><code>${fn:substringAfter(str, "@")}</code></td>
                    </tr>
                    <tr>
                        <td><code>fn:replace()</code></td>
                        <td>Replaces all occurrences</td>
                        <td><code>${fn:replace(str, "a", "b")}</code></td>
                    </tr>
                    <tr>
                        <td><code>fn:contains()</code></td>
                        <td>Checks if string contains substring</td>
                        <td><code>${fn:contains(str, "test")}</code></td>
                    </tr>
                    <tr>
                        <td><code>fn:containsIgnoreCase()</code></td>
                        <td>Case-insensitive contains check</td>
                        <td><code>${fn:containsIgnoreCase(str, "test")}</code></td>
                    </tr>
                    <tr>
                        <td><code>fn:startsWith()</code></td>
                        <td>Checks if string starts with prefix</td>
                        <td><code>${fn:startsWith(str, "pre")}</code></td>
                    </tr>
                    <tr>
                        <td><code>fn:endsWith()</code></td>
                        <td>Checks if string ends with suffix</td>
                        <td><code>${fn:endsWith(str, "fix")}</code></td>
                    </tr>
                    <tr>
                        <td><code>fn:indexOf()</code></td>
                        <td>Returns position of substring</td>
                        <td><code>${fn:indexOf(str, "sub")}</code></td>
                    </tr>
                    <tr>
                        <td><code>fn:join()</code></td>
                        <td>Joins array elements with delimiter</td>
                        <td><code>${fn:join(arr, ",")}</code></td>
                    </tr>
                    <tr>
                        <td><code>fn:split()</code></td>
                        <td>Splits string into array</td>
                        <td><code>${fn:split(str, ",")}</code></td>
                    </tr>
                    <tr>
                        <td><code>fn:escapeXml()</code></td>
                        <td>Escapes XML special characters</td>
                        <td><code>${fn:escapeXml(str)}</code></td>
                    </tr>
                </table>
            </div>
            
        </div>
        
        <footer>
            <p><strong>JSTL Functions Library Demo</strong> | COHORT 12 Training</p>
            <p>Generated: <%= new Date() %></p>
        </footer>
    </div>
</body>

</html>