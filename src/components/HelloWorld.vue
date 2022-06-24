<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
    <p>
      This is a micro services application demo,<br>
      access website
      <a href="https://jingxianginfo.com" target="_blank" rel="noopener">JingXiang Info</a>.
    </p>
    <h3>Demo Services Status</h3>
    <br>
    <button type="button" class="el-button el-button--small el-button--primary is-round" @click="checkStatus"><span>Refresh</span></button>
    <ul>
      <li> 
        <div class="tag-group">
          <span class="tag-group__title"> JavaScript </span>  
          <span :class="js.status.cls">{{ js.status.txt }}</span>
        </div>
      </li>
      <li> 
        <div class="tag-group">
          <span class="tag-group__title"> Java </span>  
          <span :class="java.status.cls">{{ java.status.txt }}</span>
        </div>
      </li>
      <li> 
        <div class="tag-group">
          <span class="tag-group__title"> Python </span>  
          <span :class="python.status.cls">{{ python.status.txt }}</span>
        </div>
      </li>
      <li> 
        <div class="tag-group">
          <span class="tag-group__title"> Go </span>  
          <span :class="go.status.cls">{{ go.status.txt }}</span>
        </div>
      </li>
    </ul>
    <h3>TMan Services</h3>
    <ul>
      <li><a :href="js.repo" target="_blank" rel="noopener">JavaScript</a></li>
      <li><a :href="java.repo" target="_blank" rel="noopener">Java</a></li>
      <li><a :href="python.repo" target="_blank" rel="noopener">Python</a></li>
      <li><a :href="go.repo" target="_blank" rel="noopener">Go</a></li>
    </ul>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  name: 'HelloWorld',
  props: {
    msg: String
  },
  data () {
    return {
      svcUp: {
        cls: 'el-tag el-tag--success el-tag--dark',
        txt: 'UP'
      },
      svcDown: {
        cls: 'el-tag el-tag--danger el-tag--dark',
        txt: 'DOWN'
      },
      js: {
        api: '',
        status: {
          cls: 'el-tag el-tag--danger el-tag--dark',
          txt: 'DOWN'
        },
        repo: 'https://github.com/seoktaehyeon/tman-demo-service-js'
      },
      java: {
        api: '/java/api/status',
        status: {
          cls: 'el-tag el-tag--danger el-tag--dark',
          txt: 'DOWN'
        },
        repo: 'https://github.com/seoktaehyeon/tman-demo-service-java'
      },
      python: {
        api: '/python/api/status',
        status: {
          cls: 'el-tag el-tag--danger el-tag--dark',
          txt: 'DOWN'
        },
        repo: 'https://github.com/seoktaehyeon/tman-demo-service-python'
      },
      go: {
        api: '/go/api/status',
        status: {
          cls: 'el-tag el-tag--danger el-tag--dark',
          txt: 'DOWN'
        },
        repo: 'https://github.com/seoktaehyeon/tman-demo-service-go'
      }
    }
  },
  mounted () {
    this.checkStatus()
  },
  methods: {
    checkStatus () {
      console.log('>> Check JavaScript Service')
      this.js.status.cls = this.svcUp.cls
      this.js.status.txt = this.svcUp.txt
      console.log('JavaScript Service is UP')

      console.log('>> Check Java Service')
      axios.get(this.java.api)
        .then((response) => {
          console.log(response)
          if ( response.data.status == "healthy" ) {
            console.log('\tJava Service is UP')
            this.java.status.cls = this.svcUp.cls
            this.java.status.txt = this.svcUp.txt
          } else {
            console.error('\tJava Service is DOWN')
            this.java.status.cls = this.svcDown.cls
            this.java.status.txt = this.svcDown.txt
          }
        })
        .catch((error) => {
          console.error('\tJava Service is DOWN')
          this.java.status.cls = this.svcDown.cls
          this.java.status.txt = this.svcDown.txt
          this.$message.error(error)
        }),

      console.log('>> Check Python Service')
      axios.get(this.python.api)
        .then((response) => {
          console.log(response)
          if ( response.data.status == "healthy" ) {
            console.log('\tPython Service is UP')
            this.python.status.cls = this.svcUp.cls
            this.python.status.txt = this.svcUp.txt
          } else {
            console.error('\tPython Service is DOWN')
            this.python.status.cls = this.svcDown.cls
            this.python.status.txt = this.svcDown.txt
          }
        })
        .catch((error) => {
          console.error('\tPython Service is DOWN')
          this.python.status.cls = this.svcDown.cls
          this.python.status.txt = this.svcDown.txt
          this.$message.error(error)
        }),
        
      console.log('>> Check Go Service')
      axios.get(this.go.api)
        .then((response) => {
          console.log(response)
          if ( response.data.status == "healthy" ) {
            console.log('\tGo Service is UP')
            this.go.status.cls = this.svcUp.cls
            this.go.status.txt = this.svcUp.txt
          } else {
            console.error('\tGo Service is DOWN')
            this.go.status.cls = this.svcDown.cls
            this.go.status.txt = this.svcDown.txt
          }
        })
        .catch((error) => {
          console.error('\tGo Service is DOWN')
          this.go.status.cls = this.svcDown.cls
          this.go.status.txt = this.svcDown.txt
          this.$message.error(error)
        })
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #007dfa;
}
</style>
