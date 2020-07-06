<template>
  <div class="container-app" id="app">
    <div class="container-quiz">
      <div class="quiz-header">
        <h1>Quiz App</h1>
      </div>
      <div class="quiz-main" v-for="(element,index) in questions.slice(a,b)" v-bind:key="index" v-show="quiz">
        <div class="box-questions">
          <h2>Questions{{b}}/{{questions.length}}</h2>
          <p>{{element.question}}</p>
        </div>
        <div class="box-suggestions">
          <ul>
            <li v-for="(item,index) in element.suggestions" v-bind:key="index" :class="select ? check(item):''" v-on:click="selectResponse(item)">{{item.suggestion}}</li>
          </ul>
        </div>
        <div class="box-score" v-if="score_show">
          <h1>Your score is</h1>
          <p>{{score}}/{{questions.length}}</p>
          <button v-on:click="restartQuiz" type="button" name="button" class="restart-btn">Restart</button>
        </div>
      </div>
      <div class="quiz-footer">
        <div class="box-btn">
          <button type="button" name="button" @click="skipQuestion">Skip</button>
          <button type="button" name="button" @click="nextQuestion">Next</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>


export default {
  name: 'App',
  data(){
    return {
      questions:[
        {
          question:'How is document type initialized in HTML5.?',
          suggestions:[
            {suggestion:'<!DOCTYPE HTML>',correct:true},
            {suggestion:'</DOCTYPE html>'},
            {suggestion:'</DOCTYPE>'},
            {suggestion:'</DOCTYPE HTML>'}
          ]
        },
        {
          question:'Which among the following is correct HTML code for making a checkbox?',
          suggestions:[
            {suggestion:'<checkbox>'},
            {suggestion:'<check>'},
            {suggestion:'<input type=”checkbox”>',correct:true},
            {suggestion:'<input type=”check”'}
          ]
        },
        {
          question:'Which tag is used for creating a drop-down selection list?',
          suggestions:[
            {suggestion:'<select>'},
            {suggestion:'<option>',correct:true},
            {suggestion:'<dropdown>'},
            {suggestion:'<list>'}
          ]
        },
        {
          question:'Select the correct among the following for linking an external style sheet.',
          suggestions:[
            {suggestion:'<link rel=“stylesheet” type=“text/css” href=“style.css”>',correct:true},
            {suggestion:'<style rel=“stylesheet” type=“text/css” href=“style.css”>'},
            {suggestion:'<link>stylesheet'},
            {suggestion:'<link href=“style.css”>stylesheet'}
          ]
        },
        {
          question:'Using padding clears the area outside:',
          suggestions:[
            {suggestion:'Border'},
            {suggestion:'Content',correct:true},
            {suggestion:'Margin'},
            {suggestion:'All of the above'}
          ]
        },
      ],
      a:0,
      b:1,
      select:false,
      score:0,
      quiz : true,
      score_show:false,
      next:false,
    };
  },
  methods:{
    selectResponse(e){
      this.select = true;
      this.next = true ;
      if(e.correct){
        this.score++;
      }
    },
    check(status){
      if(status.correct){
        return 'correct'
      }else{
        return 'incorrect'
      }
    },
    nextQuestion(){
      if (!this.next) {
        return;
      }

      if(this.questions.length - 1 == this.a){
        this.score_show = true;
        this.quiz = true;
      }else{
        this.a++;
        this.b++;
        this.select = false ;
      }

    },
    skipQuestion(){
      // if (!this.next) {
      //   return;
      // }
      if(this.questions.length - 1 == this.a){
        this.score_show = true;
        this.quiz = true;
      }else{
        this.a++;
        this.b++;
      }
    },
    restartQuiz(){
      Object.assign(this.$data, this.$options.data());
    }
  }
}
</script>
<style media="screen">
*{
margin-left: auto;
letter-spacing: 2px;
}
.container-app{
display: flex;
width: 100%;
height: 100%;
justify-content: center;
}
.container-quiz{
display: flex;
width: 40%;
height: 85%;
position: absolute;
top: 0;
bottom: 0;
margin: auto;
flex-flow: column;
text-align: center;
border: 1px solid #e7eae0;
border-radius: 10px;
background-color: #fff;
box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
}
.quiz-header{
width: 100%;
height: 20%;
text-align: center;
border-bottom: 1px solid #e7eae0;
background-color: #e7eae0;
border-radius: 10px 10px 0px 0px;
}
.quiz-main{
text-align: center;
width: 100%;
height: 70%;
flex-flow: column;
margin: auto;
}
.quiz-footer{
text-align: center;
width: 100%;
height: 10%;
text-align: center;
border-bottom: 1px solid #e7eae0;
background-color: #e7eae0;
border-radius: 10px 10px 0px 0px;
}
.box-questions{
margin-top: 20px;
}
.box-suggestions{
display: flex;
width: 100%;
justify-content: center;
margin: auto;
}
.box-score{
width: 100%;
height: 20%;
padding: 200px 0 0 0;
}
ul{
display: flex;
width: 80%;
margin: 0;
padding: 0;
flex-flow: column;
height: 30px;
}
ul li{
list-style: none;
line-height: 2;
border: 1px solid #cdd2d2;
margin: 0 0 20px 0;
border-radius: 15px;
cursor: pointer;

}li:hover{
background: #333;
color: #fff;
}
.box-btn{
width: 100%;
}
.box-btn button{
width: 150px;
height: 40px;
outline: none;
border: none;
font-size: 20px;
color: #333;
cursor: pointer;
}
li.correct{
border: 1px solid green;
background-color: green;
color: #fff;
font-weight: 600;
}
li.incorrect{
border: 1px solid red;
background-color: red;
color: #fff;
font-weight: 600;
}
.restart-btn{
width: 150px;
height: 40px;
outline: none;
border: none;
font-size: 20px;
color: #333;
cursor: pointer;
}

</style>
