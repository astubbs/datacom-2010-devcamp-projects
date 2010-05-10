@echo off
rem survey.bat - doing what gallup does (except truly anonymous)
rem designed for windows XP
rem Greg Hanna

rem ========================================================================
rem initialisation

SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

rem can't make echo deal with multiple lines
rem so have to create a temp file to show users their choices.
rem only going to put this in the temp folder
if "%TEMP%"=="" goto :err_noTemp

rem some global consts and vars

call setTimeVar

set question_file=questions.txt
set answer_file=answers.txt
rem we're going to build horizontal histograms this wide
set graphWidth=50

set temp_file=%TEMP%\~%timestamp%.tmp


if not exist %question_file% goto :err_noQuestions



set menuopt=


call :doMenu

goto :done


rem ========================================================================
rem initial menu management 

:doMenu
echo.
echo Welcome to the survey
echo Please choose an option
echo 1 Answer the survey
echo 2 View the results
echo 3 Add a new question
echo 5 Quit

call :getNumeric1To5 Please choose an option
set mOpt=%menuopt%
if "%mOpt%"=="1" call :doSurvey
if "%mOpt%"=="2" call :doResults
if "%mOpt%"=="3" call :addAQuestion
if "%mOpt%"=="5" goto :done
goto :doMenu



rem ========================================================================
rem do the survey

:doSurvey

echo. > %temp_file%
set answers=%TimeStamp%

echo.
echo Please answer the following questions on a scale of 1 to 5
echo 1 = strongly agree
echo 5 = strongly disagree
echo. 

for /F "delims=" %%r in (%question_file%) do call :oneQuestion %%r

call :doSurveyConfirm

del %temp_file%


goto done





:oneQuestion
rem prompt one question if it's not empty
if "%1"=="" exit /b
call :getNumeric1To5 %*
set answers=%answers%,%menuopt%
echo %* >> %temp_file%
echo %menuopt% >> %temp_file%
exit /b



:doSurveyConfirm

echo You chose the following options:
type %temp_file%

rem note - rolled into from above.
:doSurveyConfirmPrompt

call :getNumeric1To5 Please enter 1 to save, 5 to restart
if "%menuopt%"=="1" echo %answers% >> %answer_file% & exit /b
if "%menuopt%"=="5" goto :doSurvey
goto :doSurveyConfirmPrompt




rem ========================================================================
rem show the results


:doResults


if exist %answer_file% goto doResults2
echo Cannot find the answers file %answer_file%
echo Perhaps you haven't completed the survey yet?
echo.
exit /b

:doResults2

set totalResponses=0
set set graphRatio=1
call :calcTotalResponses

rem now do the histogram for each question
rem this is a regular expression for finding the answer to the current question
rem based on it being the csv string we created.
rem initially: from start of line, however many 'non-commas' then a comma
rem note RE doesn't include the final comma because otherwise we get an  
rem issue with two % in a row in the findstr command.
rem note caret is escape character - makes things more complex
set baseQuestionRE=^^[^^,]*

for /F "delims=" %%q in (%question_file%) do call :doOneResultGraph %%q


exit /b

:doOneResultGraph
rem do a histogram for a question based on the current baseQuestionRE then update it.
rem %1 is the question

if "%1"=="" exit /b

rem display the question
echo.
echo %*

rem do a line for each of the 5 possible answers
for /L %%i in (1,1,5) DO call :doOneResultGraphLine %%i

rem append 'comma + some non-comma' to the RE for the next question
rem note we have to expand the caret again so it's not escaped
set baseQuestionRE=%baseQuestionRE:^=^^%,[^^,]*

exit /b



:doOneResultGraphLine
REM do one line. 
rem this would be where I'd use grep and wc -l  , but they ain't windows so...
rem %1 is the number of the option




rem need to count the lines that match this line.
set rLineCount=0

rem findstr is almost grep
for /F %%r in ('findstr /R "%baseQuestionRE%,%1" answers.txt') do set /A rLineCount=!rLineCount!+1
set /A numStars=%rLineCount%/graphRatio

rem now draw the histogram.

set outLine= %1    :
for /L %%n in (1,1,%numStars%) do set outLine=!outLine!*

echo %outLine%

exit /b


rem ----------------------------------------------
rem results utility functions
:calcTotalResponses
rem figure out how many answers we've got, so we can figure out a ratio
rem for an 80 column width screen.

set totalResponses=0
FOR /F %%r in ( %answer_file% ) do set /A totalResponses=!totalResponses!+1

set /A graphRatio = 1 + (%totalResponses% / graphWidth)

echo totalResponses = %totalResponses%
echo Each * represents %graphRatio% response(s)
exit /b



rem ========================================================================
rem add a question
:addAQuestion

echo Enter your question, it must be suitable for an answer rated 1 to 5
echo Note that you cannot delete a question, as it will stuff up all stored answers
echo (You'll be asked to confirm so if you change your mind, just enter anything)
set /P newQuestion=Question:
echo Please confirm you wish to add this question:
echo %newQuestion%
:addAQuestionConfirm
call :getNumeric1To5 Please enter 1 to add this question 5 to cancel
if "%menuopt%"=="1" echo %newQuestion% >> %question_file% & exit /b
if "%menuopt%"=="5" exit /b
goto :addAQuestionConfirm




rem ========================================================================
rem utility functions

:getNumeric1To5
rem user input between 1 and 5
set menuopt=
set /p menuopt=%*:
if "%menuopt%"=="1" exit/b
if "%menuopt%"=="2" exit/b
if "%menuopt%"=="3" exit/b
if "%menuopt%"=="4" exit/b
if "%menuopt%"=="5" exit/b
echo Please enter a number between 1 and 5
goto :getNumeric1To5



:setTimeVars
rem date & time and timestmap-
set t_tv_00=%time: =0%
set t_tv_00=%t_tv_00::=%
set t_tv_00=%t_tv_00:.=%
for /F " tokens=1,2,3 delims=- " %%i in ('date /t') do set t_dv=%%k%%j%%i

Set DateStr=%t_dv%_%t_tv%
Set DateOnly=%t_dv%
rem date and time to milliseconds
set TimeStamp=%t_dv%_%t_tv_00%

exit /b


rem ========================================================================
rem error management

:err_noTemp
ECHO ERROR: Survey cannot continue
echo You do not have a TEMP environment variable defined.
echo Sorry.
goto :done

:err_noQuestions
echo ERROR: Cannot find questions file: %question_file%
goto :done



rem ========================================================================
rem wrapup
:done

