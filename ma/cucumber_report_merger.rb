#####################################################################
#                                                                   #
#       32 scenarios (3 failed, 29 passed)                          #
#       65 scenarios (4 failed, 61 passed)                          #
#       11 scenarios (11 passed)                                    #
#       Overall scenarios:  108                                     #
#       Overall pass:       101                                     #
#       Overall fail:       7                                       #
#                                                                   #
#                                                                   #
#####################################################################
require 'erb'

class ReporterClass4
=begin
  @overall_scenarios = 0
  @overall_passed = 0
  @overall_fail = 0
  @overall_skipped = 0
  @overall_undefined = 0
=end

 def get_run_stats_standard
    @overall_scenarios = 0
    @overall_passed = 0
    @overall_fail = 0
    @overall_skipped = 0
    @overall_undefined = 0
    $stats = {passed: 0, failed: 0, skipped: 0, undefined: 0}
    $stats1 = {passed: 0, failed: 0, skipped: 0, undefined: 0}
    $stats2 = {passed: 0, failed: 0, skipped: 0, undefined: 0}
    $stats3 = {passed: 0, failed: 0, skipped: 0, undefined: 0}
    report = 'C:/code/ma2/DS6_Project_Trail1/features/test_result_report/MU_TestResult-05-Apr-2017_0208.html'
    report1 = 'C:/code/ma2/DS6_Project_Trail1/features/test_result_report/SA_TestResult-05-Apr-2017_0210.html'
    report2 = 'C:/code/ma2/DS6_Project_Trail1/features/test_result_report/UG_Full_TestResult-05-Apr-2017_0236.html'
    report3 = 'C:/code/ma2/DS6_Project_Trail1/features/test_result_report/SA_QAForum_TestResult-05-Apr-2017_0250.html'
    file = File.read(report)
    file2 = File.read(report1)
    file3 = File.read(report2)
    file4 = File.read(report3)

    puts "_____________________________________________________________________________"
    scenarios_line = file.lines.last.split('innerHTML = "').last.split('<br />').first
    scenarios = scenarios_line[/(\d+) scenarios/].to_i
    puts 'Merrill User Tests'
    puts '------------------'
    puts 'Total Scenarios : '+scenarios.to_s
    @overall_scenarios = 0
    @overall_scenarios = @overall_scenarios+scenarios
    puts 'This is the overall Scenarios: '+@overall_scenarios.to_s
    $stats.keys.each do |state|
      if scenarios_line.include? state.to_s
        #scenarios = scenarios_line[/(\d+) scenarios}/].to_i
        $stats[state] = scenarios_line[/(\d+) #{state.to_s}/, 1].to_i
        case state.to_s
          when 'passed'
            @overall_passed = 0
            @overall_passed = @overall_passed+$stats[state]
            puts 'Passed: '+$stats[state].to_s
            #puts 'This is the overall passed: '+@overall_passed.to_s
          when 'failed'
            #puts state
            @overall_fail = 0
            @overall_fail = @overall_fail+$stats[state]
            puts 'Failed: '+$stats[state].to_s
            #puts 'This is the overall failed: '+@overall_fail.to_s
          when 'skipped'
            @overall_skipped = 0
            @overall_skipped = @overall_skipped+$stats[state]
            puts 'Skipped: '+$stats[state].to_s
            #puts 'This is the overall skipped: '+@overall_skipped.to_s
          when 'undefined'
            @overall_undefined = 0
            @overall_undefined = @overall_undefined+$stats[state]
            puts 'Undefined: '+$stats[state].to_s
            #puts 'This is the overall undefined: '+@overall_undefined.to_s
        end
      end
    end

    puts "_____________________________________________________________________________"
    scenarios_line1 = file2.lines.last.split('innerHTML = "').last.split('<br />').first
    scenarios1 = scenarios_line1[/(\d+) scenarios/].to_i
    puts 'Site-Admin Tests'
    puts '-----------------'
    puts 'Total Scenarios : '+scenarios1.to_s
    @overall_scenarios = @overall_scenarios+scenarios1
    puts 'This is the overall Scenarios: '+@overall_scenarios.to_s
    $stats1.keys.each do |state|
      if scenarios_line1.include? state.to_s
        $stats1[state] = scenarios_line1[/(\d+) #{state.to_s}/, 1].to_i
        case state.to_s
          when 'passed'
            #@overall_passed = 0
            @overall_passed = @overall_passed+$stats1[state]
            puts 'Passed: '+$stats1[state].to_s
          #puts 'This is the overall passed: '+@overall_passed.to_s
          when 'failed'
            #puts state
            #@overall_fail = 0
            @overall_fail = @overall_fail+$stats1[state]
            puts 'Failed: '+$stats1[state].to_s
          #puts 'This is the overall failed: '+@overall_fail.to_s
          when 'skipped'
            #@@overall_skipped = 0
            @overall_skipped = @overall_skipped+$stats1[state]
            puts 'Skipped: '+$stats1[state].to_s
          #puts 'This is the overall skipped: '+@overall_skipped.to_s
          when 'undefined'
            # @@overall_undefined = 0
            @overall_undefined = @overall_undefined+$stats1[state]
            puts 'Undefined: '+$stats1[state].to_s
          #puts 'This is the overall undefined: '+@overall_undefined.to_s
        end
      end
    end

      puts "_____________________________________________________________________________"
      scenarios_line2 = file3.lines.last.split('innerHTML = "').last.split('<br />').first
      scenarios2 = scenarios_line2[/(\d+) scenarios/].to_i
      puts 'Users Tests'
      puts '------------'
      puts 'Total Scenarios : '+scenarios2.to_s
      @overall_scenarios = @overall_scenarios+scenarios2
      puts 'This is the overall Scenarios: '+@overall_scenarios.to_s
      $stats2.keys.each do |state|
        if scenarios_line2.include? state.to_s
          $stats2[state] = scenarios_line2[/(\d+) #{state.to_s}/, 1].to_i
          case state.to_s
            when 'passed'
              #@overall_passed = 0
              @overall_passed = @overall_passed+$stats2[state]
              puts 'Passed: '+$stats2[state].to_s
             # puts 'This is the overall passed: '+@overall_passed.to_s
            when 'failed'
              #puts state
              #@overall_fail = 0
              @overall_fail = @overall_fail+$stats2[state]
              puts 'Failed: '+$stats2[state].to_s
              #puts 'This is the overall failed: '+@overall_fail.to_s
            when 'skipped'
              #@@overall_skipped = 0
              @overall_skipped = @overall_skipped+$stats2[state]
              puts 'Skipped: '+$stats2[state].to_s
              puts 'This is the overall skipped: '+@overall_skipped.to_s
            when 'undefined'
              #@@overall_undefined = 0
              @overall_undefined = @overall_undefined+$stats2[state]
              puts 'Undefined: '+$stats2[state].to_s
              puts 'This is the overall undefined: '+@overall_undefined.to_s
          end
        end
      end

    puts "_____________________________________________________________________________"
    scenarios_line3 = file4.lines.last.split('innerHTML = "').last.split('<br />').first
    scenarios3 = scenarios_line3[/(\d+) scenarios/].to_i
    puts 'Site-Admin QA Tests'
    puts '--------------------'
    puts 'Total Scenarios : '+scenarios3.to_s
    #@overall_scenarios = 0
    @overall_scenarios = @overall_scenarios+scenarios3
    puts 'This is the overall Scenarios: '+@overall_scenarios.to_s
    $stats3.keys.each do |state|
      if scenarios_line3.include? state.to_s
        #scenarios = scenarios_line[/(\d+) scenarios}/].to_i
        $stats3[state] = scenarios_line3[/(\d+) #{state.to_s}/, 1].to_i
        case state.to_s
          when 'passed'
            @overall_passed = @overall_passed+$stats3[state]
            puts 'Passed: '+$stats3[state].to_s
            #puts 'This is the overall passed: '+@overall_passed.to_s
          when 'failed'
            #puts state
            @overall_fail = @overall_fail+$stats3[state]
            puts 'Failed: '+$stats3[state].to_s
            #puts 'This is the overall failed: '+@overall_fail.to_s
          when 'skipped'
            @overall_skipped = @overall_skipped+$stats3[state]
            puts 'Skipped: '+$stats3[state].to_s
            #puts 'This is the overall skipped: '+@overall_skipped.to_s
          when 'undefined'
            @overall_undefined = @overall_undefined+$stats3[state]
            puts 'Undefined: '+$stats3[state].to_s
            #puts 'This is the overall undefined: '+@overall_undefined.to_s
         end
       end
     end

    puts "_____________________________________________________________________________"
    puts 'Automation Test Report (M&A): Functional Test'
    puts '----------------------------------------------'
    puts 'Total Scenarios: '+@overall_scenarios.to_s
    puts 'Passed: '+@overall_passed.to_s
    puts 'Failed: '+@overall_fail.to_s
    puts 'Skipped: '+@overall_skipped.to_s
    puts 'Undefined: '+@overall_undefined.to_s
    puts "_____________________________________________________________________________"

      # reporter = File.new("Htmlfilecreation.html", "w+")
      # reporter.write "<html><body><table><th>"
      # reporter.write "<td>Scenarios</td>"
      # reporter.write "<td>Passed</td>"
      # reporter.write "<td>Failed</td>"
      # reporter.write "<td>Blocked</td>"
      # reporter.write "</th>"
      # reporter.write "<tr><td>"
      # reporter.write '<b>' + scenarios_line.to_s + '</b>'
      # reporter.write '</td><td>'
      # reporter.write "'<u>'" + scenarios_line1.to_s + "'</u>'"
      # reporter.write "'</td><td>'"
      # reporter.write "'<i>'" + scenarios_line2.to_s + "'</i>'"
      # reporter.write "'</td><td>'"
      # reporter.write "'</td></tr></table></body></html>'"

######################################################################################
 #    Canvas report:  A java script report to generate the a chart in HTML
######################################################################################

    reporter = File.new("Htmlfilecreation2.html", "w+")
    reporter.write   "<html>"
    reporter.write "<head>"
    reporter.write "<script type='text/javascript'>"
    reporter.write "window.onload = function () {"
    reporter.write "var chart = new CanvasJS.Chart('chartContainer',"
    reporter.write "{"
    reporter.write "                                        title:{"
    reporter.write "text: 'DataSite Automation (M&A)'"
    reporter.write "},"
    reporter.write "                      legend: {"
    reporter.write "maxWidth: 350,"
    reporter.write "                                                 itemWidth: 120"
    reporter.write "                                         },"
    reporter.write "data: ["
    reporter.write "                                                 {"
    reporter.write "                                 type: 'pie',"
    reporter.write "showInLegend: true,"
    reporter.write "             legendText: '{indexLabel}',"
    reporter.write "dataPoints: ["
    reporter.write "{ y: "+@overall_passed.to_s+", indexLabel: 'Passed' }," #4181563
    reporter.write "{ y: "+@overall_fail.to_s+", indexLabel: 'Failed' },"
    reporter.write "{ y: "+@overall_skipped.to_s+", indexLabel: 'Skipped' },"
    reporter.write "{ y: "+@overall_undefined.to_s+", indexLabel: 'Undefined'},"
    reporter.write "]"
    reporter.write "                           }"
    reporter.write "]"
    reporter.write "                   });"
    reporter.write "chart.render();"
    reporter.write "}"
    reporter.write "</script>"
    reporter.write "<script type='text/javascript' src='C:/code/ma2/DS6_Project_Trail1/canvasjs-1.9.8/canvasjs.min.js'></script>"
	#C:/Users/105983.ADMINSYS.000/Desktop/canvasjs-1.9.8/canvasjs.min.js'></script>"
    #reporter.write "<script type='text/javascript' src='C:/Users/105983.ADMINSYS.000/Desktop/canvasjs-1.9.8/jschart.js'></script>"
    reporter.write "</head>"
    reporter.write "<body>"
    reporter.write "<div id='chartContainer' style='height: 300px; width: 100%;'></div>"
    reporter.write "</body>"
    reporter.write "</html>"
    end
  end

stephen = ReporterClass4.new
stephen.get_run_stats_standard