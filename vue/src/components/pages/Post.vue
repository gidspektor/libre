<template>
  <main class='section container-fluid mt-5 pt-5'>
    <div>
      <div class='row d-flex justify-content-center my-lg-4 my-4 bg-white cardStyles'>
        <div class='noUnderline col-10 item mt-2'>
          <div class='pb-lg-0 pt-lg-2 mr-lg-0'>
            <h5 class='mb-lg-3'>{{post.title}}</h5>
            <h6>{{post.location}}</h6>
            <p v-if='!showModal' class='font-weight-light font-italic text'>{{post.description}}</p>
          </div>
          <h6 class='mt-5'>{{post.user_name}}</h6>
          <h6 class='mb-3'>{{formatDate(post.date_time)}}</h6>
        </div>
      </div>
      <div v-for='(comment, index) in this.comments'
        :key='index'
        increasePageHeight
        class='row d-flex justify-content-center my-lg-4 my-4 bg-white cardStyles'
      >
        <div class='noUnderline col-10 item mt-2'>
          <div class='pb-lg-0 pt-lg-2 mr-lg-0'>
            <p class='font-weight-light font-italic text'>{{comment.comment}}</p>
            <h6 class='mt-5'>{{comment.user_name}}</h6>
            <h6>{{formatDate(comment.date_time)}}</h6>
          </div>
        </div>
      </div>
      <div v-if='!showModal' class='row d-flex justify-content-center'>
        <textarea v-model='inputComment' class='form-control inputfield mt-4 col-lg-10 col-10' placeholder='Leave a comment'></textarea>
      </div>
      <div class='alert alert-danger error mt-1 text-center' role='alert' v-show='error'>
        {{ error }}
      </div>
      <div v-if='!showModal' class='row d-flex justify-content-center mt-4'>
        <button @click='isLoggedIn' class='btn logoColour libreFont col-lg-6 col-10 mb-4'>Post comment</button>
      </div>
      <div class='overlay' v-show='showModal'>
      <transition name='fade'>
        <LoginSignupModal
          id='modal'
          class='myModal'
          v-show='showModal'
          @close-modal='closeModal'
          @next-page='submitComment'
          >
          </LoginSignupModal>
      </transition>
    </div>
    </div>
  </main>
</template>

<script>
// import axios from 'axios'
import {post, get} from '../../http-common'
import {inspectToken, formatDate} from '../../tools'
import LoginSignupModal from '../LoginSignupModal'
import store from '../../store'

export default {
  components: {
    LoginSignupModal
  },

  data () {
    return {
      post: '',
      error: '',
      inputComment: '',
      showModal: false,
      comments: [],
      formatDate: formatDate
    }
  },

  created () {
    this.post = JSON.parse(store.state.selectedPost)
    this.comments = this.getComments()
  },

  methods: {
    async getComments () {
      let response = await get(`get-comments/${this.post.id}`)

      this.comments = response.data
      this.inputComment = ''
    },
    async submitComment () {
      if (/\S/.test(this.inputComment)) {
        let cleanedComment = this.inputComment.replace(/[^a-z'A-Z!?0-9 ]/, '').replace(/[/(){}:*]/g, '')
        this.showModal = false
        document.querySelector('body').style.overflow = ''

        let data = {comment: cleanedComment, post: this.post.id}
        let response = await post('create-comment/', data).catch(error => {
          this.error = error.response.data
        })

        if (response.status === 201) {
          this.getComments()
        }
      }
    },
    closeModal () {
      this.showModal = false
      document.querySelector('body').style.overflow = ''
    },
    async isLoggedIn (event) {
      if (/\S/.test(this.inputComment)) {
        let tokenState = inspectToken()

        if (!tokenState || tokenState === 'expired') {
          this.showModal = true
          document.querySelector('body').style.overflow = 'hidden'
        } else if (tokenState === 'refresh') {
          await this.$store.dispatch('refreshToken')
          this.submitComment()
        }

        if (tokenState === 'active') {
          this.submitComment()
        }
      }
    }
  }
}
</script>

<style scoped>
.cardStyles {
  height: 300px;
  border-bottom: solid rgb(230, 227, 227);
}

.libreFont {
  font-family: 'Lucida Sans';
}

.myModal {
  z-index: 1000;
  position: fixed;
  bottom: 60%;
  left: 50%;
  width:30em;
  height:18em;
  margin-top: -9em;
  margin-left: -15em;
}

.overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  background-color: rgba(128,128,128,0.5);
}

.logoColour {
  background-color: rgb(13, 201, 44);
}

.noUnderline {
  color: inherit;
  text-decoration: none !important
}

.item {
  display: inline-block;
}

.text {
  font-size: 14px;
}

.section {
  height: auto;
}

.inputfield {
  height: 200px;
  resize: none;
}
</style>
